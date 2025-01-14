FROM node:20-slim

WORKDIR /app

COPY . .

RUN npm install -g pnpm
RUN pnpm install

RUN pnpm run build

EXPOSE 3001

CMD ["sh", "-c", "pnpm db:migrate && pnpm run start:prod"]