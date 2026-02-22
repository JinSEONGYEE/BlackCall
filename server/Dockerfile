# Build stage
FROM node:20-alpine AS builder

WORKDIR /app

# Copy package files
COPY server/package*.json ./
COPY server/prisma ./prisma/

# Install dependencies
RUN npm install

# Copy source code
COPY server/ .

# Generate Prisma client
RUN npx prisma generate

# Build the app
RUN npm run build

# Production stage
FROM node:20-alpine AS runner

WORKDIR /app

# Copy necessary files from builder
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/prisma ./prisma

# Expose port
EXPOSE 3000

# Set environment
ENV NODE_ENV=production

# Start command
CMD ["npm", "run", "start:prod"]
