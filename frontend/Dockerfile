# Based on official Node.js latest LTS
FROM node:lts

# Install PM2 globally
RUN npm install --global pm2

# Change to user node (uid:1000)
USER node

# Create working directory
RUN mkdir /home/node/app
WORKDIR /home/node/app

# Copy package.json and package-lock.json before other files
# Utilise Docker cache to save re-installing dependencies if unchanged
COPY --chown=node:node ./package*.json ./

RUN npx browserslist@latest --update-db

# Install dependencies
RUN npm ci

# Copy all source files
COPY --chown=node:node ./ ./

# Expose app port
EXPOSE 3000

# Run app when container starts
CMD [ "npm", "run", "dev" ]