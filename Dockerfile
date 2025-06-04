
FROM golang:1.24 AS build-backend-stage

WORKDIR /app
ADD ./back/migrations ./migrations
COPY ./back/go.mod ./back/go.sum ./
RUN go mod download

COPY ./back/*.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /backend

# stage1 as builder
FROM node:lts-alpine3.20 AS build-front-stage

WORKDIR /app

# Copy the package.json and install dependencies
COPY front/package*.json ./
RUN npm install
# Copy rest of the files
COPY front ./

# Build the project
RUN npm run build

# Deploy the application binary into a lean image
FROM gcr.io/distroless/base-debian11 AS build-release-stage

WORKDIR /

COPY --from=build-backend-stage /backend /backend
COPY --from=build-front-stage /app/dist /pb_public

EXPOSE 8080

COPY --from=build-backend-stage /app/migrations /migrations

ENTRYPOINT ["/backend", "serve", "--http=0.0.0.0:8080"]