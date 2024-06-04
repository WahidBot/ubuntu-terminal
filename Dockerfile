# Gunakan image dasar yang sesuai
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install coder
RUN curl -L https://coder.com/install.sh | sh

# Expose port
EXPOSE 3000

# Start coder server
CMD ["coder", "server"]
