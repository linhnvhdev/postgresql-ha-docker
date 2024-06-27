FROM haproxy:latest

USER root

# Install Keepalived and other necessary packages
RUN apt-get update && apt-get install -y bash python3 curl unzip ipvsadm iproute2 openrc keepalived procps && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /usr/lib/keepalived

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip && \
    rm -rf ./aws

# Create a startup script
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
