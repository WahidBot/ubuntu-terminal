# Gunakan image dasar Ubuntu
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update package list dan install dependensi dasar
RUN apt-get update && \
    apt-get install -y curl wget build-essential libssl-dev

# Install Python
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.10 python3.10-distutils

# Install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.10 get-pip.py && \
    rm get-pip.py

# Install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Load nvm and install latest Node.js
RUN /bin/bash -c "source $HOME/.nvm/nvm.sh && nvm install node"

# Install JupyterLab
RUN /bin/bash -c "source $HOME/.nvm/nvm.sh && npm install -g jupyterlab && pip install jupyterlab"

# Expose the JupyterLab port
EXPOSE 8888

# Set the working directory
WORKDIR /workspace

# Command to run JupyterLab
CMD ["bash", "-c", "source $HOME/.nvm/nvm.sh && jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root"]

