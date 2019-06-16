FROM node:4.2
ENV VERSION=1.0.1
COPY . /src
# COPY /src/xray-daemon/xray /usr/bin/xray-daemon
RUN cd /src && npm install
EXPOSE 8000
CMD ["node", "/src/app.js"]
# CMD xray-daemon -f /var/log/xray-daemon.log & node /src/app.js