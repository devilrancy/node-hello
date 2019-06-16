FROM node:4.2
ENV VERSION=1.0.0
COPY . /src
RUN cd /src && npm install
EXPOSE 4000
CMD ["node", "/src/app.js"]