# Set the base image
ARG DOCKER_IMAGE_TAG=${DOCKER_IMAGE_TAG}
FROM rockylinux:${DOCKER_IMAGE_TAG}

# Set ARG
ARG TZ=Asia/Tokyo
ARG USER_NAME=${USER_NAME}

# Set TimeZone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Repository Update
RUN dnf update -y

# Install Packages
RUN dnf install sudo -y &&\
    dnf install git -y &&\
    dnf install unzip -y

# Get the latest version of node.js from the NodeSource repository
RUN curl -fsSL https://rpm.nodesource.com/setup_current.x | bash -

# Install node.js
RUN dnf install nodejs -y

# Install yarn
RUN npm install yarn -g

# Install create-react-app
RUN yarn global add create-react-app

# Add User
RUN adduser ${USER_NAME} --badname

# Setup to use sudo without password
RUN echo "${USER_NAME} ALL=NOPASSWD: ALL" >> /etc/sudoers

# Setup WORKDIR
WORKDIR /home/${USER_NAME}

# Change User
USER ${USER_NAME}

# Setup alias
COPY ./.alias /home/${USER_NAME}/
RUN cat ~/.alias >> ~/.bashrc &&\
    rm .alias