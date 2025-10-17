FROM docker.n8n.io/n8nio/n8n:latest

USER root
RUN mkdir -p /home/node/.n8n/nodes

# Install the community node(s) into the custom nodes directory
RUN npm install --prefix=/home/node/.n8n/nodes n8n-nodes-globals
RUN npm install -g @alpacahq/alpaca-trade-api
RUN npm install -g sec-api

USER node
