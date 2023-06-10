FROM node:20.3-alpine

ENV MC2_INSTALL_PATH /opt/meshcentral

RUN mkdir -p ${MC2_INSTALL_PATH} && \
    cd ${MC2_INSTALL_PATH} && \
    npm install meshcentral

ENTRYPOINT ["node", "/opt/meshcentral/node_modules/meshcentral/meshcentral"]