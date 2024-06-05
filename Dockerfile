# Gunakan image dasar
FROM python:3.10
FROM node:latest
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install JupyterLab
RUN pip install jupyterlab

# Expose the JupyterLab port
EXPOSE 8888

# Set the working directory
WORKDIR /workspace

# Command to run JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
