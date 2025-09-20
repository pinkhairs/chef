# Use Node 20 (same as Convex)
FROM node:20-alpine

WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm

# Copy deps and install
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# Copy source
COPY . .

# Build Next.js app
RUN pnpm build

# Expose port
EXPOSE 3000

# Run in production mode
CMD ["pnpm", "start"]
