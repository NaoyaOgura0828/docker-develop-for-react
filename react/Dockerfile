# Set the base image
ARG BASE_IMAGE_TAG=${BASE_IMAGE_TAG}
FROM ubuntu:${BASE_IMAGE_TAG}

# Set ARG
ARG TZ=Asia/Tokyo
ARG USER_NAME=${USER_NAME}
ARG NODEJS_MAJOR_VERSION=${NODEJS_MAJOR_VERSION}

# Set TimeZone
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# Repository Update
RUN apt-get update -y &&\
    apt-get upgrade -y

# Install Packages
RUN apt-get install curl -y &&\
    apt-get install git -y &&\
    apt-get install gnupg2 -y &&\
    apt-get install software-properties-common -y &&\
    apt-get install sudo -y &&\
    apt-get install unzip -y &&\
    apt-get install vim -y &&\
    apt-get install wget -y &&\
    apt-get install zip -y

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup_${NODEJS_MAJOR_VERSION}.x -o nodesource_setup.sh &&\
    bash nodesource_setup.sh &&\
    apt-get install nodejs -y

# Install yarn
RUN npm install yarn -g

# Install create-react-app
RUN yarn global add create-react-app

# Add User
RUN adduser ${USER_NAME} --force-badname

# Setup to use sudo without password
RUN echo "${USER_NAME} ALL=NOPASSWD: ALL" >> /etc/sudoers

# Setup WORKDIR
WORKDIR /home/${USER_NAME}
