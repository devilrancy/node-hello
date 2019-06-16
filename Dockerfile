FROM node:4.2
ENV VERSION=1.0.1
COPY . /src
RUN cd /src && npm install
EXPOSE 8000
CMD ["node", "/src/app.js"]