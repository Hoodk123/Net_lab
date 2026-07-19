FROM alpine:latest
LABEL maintainer="HOODK"

# Install necessary packages for SSH and FRR using apk
# frr is the package name for FRRouting in Alpine
RUN apk update && apk add --no-cache \
    openssh-server \
    frr \
    iputils-ping \
    net-tools \
    iproute2 \
    # Clean up apk cache to keep image size minimal
    && rm -rf /var/cache/apk/*

# generating SSH host Keys
RUN ssh-keygen -A

# Configure SSH (same as Ubuntu, adjust paths if needed, though often similar)
# IMPORTANT: Change root:rootpass for real use cases!
RUN mkdir -p /var/run/sshd
RUN echo 'root:rootpass' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

EXPOSE 22

# Copy the startup script into the image
COPY start_frr_ssh.sh /usr/local/bin/start_frr_ssh.sh

# Make the script executable
RUN chmod +x /usr/local/bin/start_frr_ssh.sh

# Change the CMD to run your new script
CMD ["/usr/local/bin/start_frr_ssh.sh"]
