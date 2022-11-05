FROM rockylinux:9.0

# Execution user name after container startup
ARG USER_NAME

# Repository Update
RUN dnf update -y

# Install sudo
RUN dnf install sudo -y

# Install git
RUN dnf install git -y

# Get the latest version of node.js from the NodeSource repository
RUN curl -fsSL https://rpm.nodesource.com/setup_current.x | bash -

# Install node.js
RUN dnf install nodejs -y

# Install yarn
RUN npm install yarn -g

# Install create-react-app
RUN yarn global add create-react-app

# Add User
RUN adduser ${USER_NAME} --badnames

# Setup to use sudo without password
RUN echo "${USER_NAME} ALL=NOPASSWD: ALL" | tee /etc/sudoers

ENTRYPOINT tail -f /dev/null