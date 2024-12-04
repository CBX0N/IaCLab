FROM node:16
WORKDIR /app
COPY index.jsx index.js
RUN npm install
RUN npm run build
CMD ["npx", "serve", "-s", "build"]
