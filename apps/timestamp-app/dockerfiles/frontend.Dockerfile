FROM node:16
WORKDIR /app
COPY index.jsx index.jsx
RUN npm install
RUN npm run build
CMD ["npx", "serve", "-s", "build"]
