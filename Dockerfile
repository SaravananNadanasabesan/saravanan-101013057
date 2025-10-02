# Dockerfile
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package files first (helps with caching)
COPY package*.json ./

# Install dependencies (prod only)
RUN npm ci --omit=dev

# Copy all source code
COPY . .

# Expose the app port
ENV PORT=3000
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
