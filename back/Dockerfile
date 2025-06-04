FROM golang:1.24 AS setup-backend-stage

WORKDIR /

COPY ./internal  ./internal
COPY ./migrations ./migrations
COPY ./*.go ./
COPY go.mod go.sum ./
RUN go mod download

FROM setup-backend-stage AS dev

ENTRYPOINT ["go", "run", "main.go", "--dev" ,"serve", "--http=0.0.0.0:8080"]

FROM setup-backend-stage AS build

RUN CGO_ENABLED=0 GOOS=linux go build -o /backend

FROM gcr.io/distroless/base-debian11:nonroot AS release-stage

COPY --from=build --chown=nonroot:nonroot /backend /backend 
COPY --from=build --chown=nonroot:nonroot /migrations /migrations

ENTRYPOINT ["/backend", "serve", "--http=0.0.0.0:8080"]

# Deploy the application binary into an image with shell
FROM gcr.io/distroless/base-debian12:debug AS release-debug-stage

COPY --from=build --chown=nonroot:nonroot /ain-pb /ain-pb
COPY --from=build --chown=nonroot:nonroot /migrations /migrations

ENTRYPOINT ["/ain-pb", "serve", "--http=0.0.0.0:8080"]