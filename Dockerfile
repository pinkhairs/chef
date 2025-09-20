# Use Node 20 (Convex compatible)
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm

# Copy dependency manifests + patches first for layer caching
COPY package.json pnpm-lock.yaml .npmrc* pnpm-workspace.yaml* patches/ ./

# Install dependencies (respect lockfile & patches)
RUN pnpm install --frozen-lockfile

# Copy the rest of the source
COPY . .

# Build the Next.js app
RUN pnpm build

# Expose Next.js default port
EXPOSE 3000

# Run in production mode
CMD ["pnpm", "start"]
