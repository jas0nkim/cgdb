# Based on official Node.js latest LTS
FROM node:lts

# Install PM2 globally
RUN npm install --global pm2

# Run container as non-root (unprivileged) user
# The node user is provided in the Node.js Alpine base image
# Create new user: appuser (node uid = 1000)
RUN useradd -r -m -d /home/appuser/ -u 999 -g node appuser \
    && chown -R appuser /home/appuser/
USER appuser

# Create working directory
RUN mkdir /home/appuser/app
WORKDIR /home/appuser/app

# Copy package.json and package-lock.json before other files
# Utilise Docker cache to save re-installing dependencies if unchanged
COPY --chown=appuser:node ./package*.json ./

RUN npx browserslist@latest --update-db

# Install dependencies
RUN npm ci

# Copy all source files
COPY --chown=appuser:node ./ ./

# Build app
RUN npm run build

# Expose app port
EXPOSE 3000

# Run npm start script when container starts
CMD [ "pm2-runtime", "npm", "--", "start" ]