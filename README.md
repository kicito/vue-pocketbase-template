# Project Template

This is a full-stack application template with Vue.js frontend and Go backend using PocketBase.

## Project Structure

```
project-template/
├── front/              # Vue 3 frontend
├── back/               # Go backend with PocketBase
├── compose.yml         # Docker Compose configuration
└── Dockerfile          # Main Dockerfile for production build
```

## Frontend

The frontend is built with:
- Vue 3
- Vue Router
- Pinia for state management
- TypeScript
- Vite for development and building

### Frontend Development

```sh
# Navigate to frontend directory
cd front

# Install dependencies
npm install

# Start development server
npm run dev
```

## Backend

The backend is built with:
- Go
- PocketBase (an open-source backend for SPA and mobile apps)

## Docker Development

You can use Docker Compose for development:

```sh
# Start development environment
docker compose up frontend-dev backend-dev
```

This will:
- Start the backend server at http://localhost:8081
- Start the frontend development server at http://localhost:5173

## Production Build

To build and run the application for production:

```sh
# Build and run production container
docker compose --profile prod up
```

This will:
- Build the frontend and backend
- Serve the application at http://localhost:8080

## Project Configuration

- The backend connects to a SQLite database (provided by PocketBase)
- The frontend is configured with TypeScript and Vue 3
- The project uses Docker for containerization

## Files of Interest

- `front/src/App.vue` - Main Vue application
- `front/src/router/index.ts` - Vue Router configuration
- `front/src/stores/counter.ts` - Pinia store example
- `back/main.go` - Main Go backend application

## Development Tools

The frontend includes configuration for:
- ESLint
- Prettier
- TypeScript
- VSCode recommended extensions