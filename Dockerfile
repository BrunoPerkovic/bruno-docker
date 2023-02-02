# Use the node:19-alpine image as the base image
FROM node:19-alpine

# Create a group and user named 'app'
RUN addgroup -S app && adduser -S -G app app

# Switch to the 'app' user
USER app

# Set the working directory to /app
WORKDIR app


# Copy the package.json and package-lock.json files
COPY package*.json ./

# Run the npm install command to install the dependencies
RUN npm install

RUN npm install --save-dev nodemon

RUN npm install -g nodemon

# Copy the rest of the files in the current directory to the /app directory in the image
COPY . .

# Change the ownership of the /app directory to the 'app' user and group
RUN chown -R app:app app

# Expose port 3000
EXPOSE 3000

# Start the application using the command `npm run start:dev`
CMD [ "npm", "run", "start:dev" ]
