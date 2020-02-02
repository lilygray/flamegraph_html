# Flamegraph Dockerfile

# Pull Base Image
FROM ubuntu:16.04

# Install Base Packages
RUN \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y nodejs npm

WORKDIR /app

# Install app dependencies
RUN \
    npm install d3 && \
    npm install d3-flame-graph --save

# Set up HTML
FROM nginx:alpine
COPY . /usr/share/nginx/html
COPY --from=0 /app /usr/share/nginx/html

#-----------------------------
# Flamegraph Dockerfile

# Pull Base Image
#FROM ubuntu:16.04

# Install Base Packages
#RUN \
#	apt-get update && \
#	apt-get -y upgrade && \
#	apt-get install -y nodejs npm

# Install app dependencies
#RUN \
#	npm install d3-flame-graph --save

# Set up HTML
#FROM nginx:alpine
#COPY . /usr/share/nginx/html

