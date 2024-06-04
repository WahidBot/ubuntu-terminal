# Gunakan image gitpod/openvscode-server sebagai dasar
FROM gitpod/openvscode-server

# Expose port 3000
EXPOSE 3000

# Set the working directory
WORKDIR /home/workspace

# The CMD instruction to start the server
CMD ["openvscode-server"]
