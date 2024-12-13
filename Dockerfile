# Use an official Node.js runtime as a base image
FROM node:21-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm ci --only=production

# Copy the application code to the working directory
COPY . .

# Expose the port your app will run on
EXPOSE 3000

# Use a non-root user for security
RUN useradd -m appuser
USER appuser

# Command to run your application
CMD ["node", "index.js"]
