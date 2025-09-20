FROM node:20-alpine

WORKDIR /app

RUN npm install -g pnpm

# Copy everything so patches/ is definitely there
COPY . .

RUN pnpm install --frozen-lockfile
RUN pnpm build

EXPOSE 3000
CMD ["pnpm", "start"]
