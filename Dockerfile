# Dockerfile
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package files first (for caching)
COPY package*.json ./

# Install dependencies (production only)
RUN npm ci --omit=dev

# Copy all source code
COPY . .

# Expose Cloud Run default port
EXPOSE 8080

# Start the app
CMD ["npm", "start"]
