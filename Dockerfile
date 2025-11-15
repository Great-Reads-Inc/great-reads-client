# Use an official Node.js runtime as a parent image
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 5173

# Command to run the development server
# The --host 0.0.0.0 is important for Docker to expose the server correctly
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
