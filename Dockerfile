FROM ghcr.io/lazzurs/jenkins-agent-amazonlinux2:latest

# Switch to root
USER root

# Install Docker. The lazzurs base image is Amazon Linux 2023 (public.ecr.aws/amazonlinux/amazonlinux:latest),
# where amazon-linux-extras no longer exists; the docker package is in the core dnf repo.
RUN dnf install -y docker && dnf clean all

# Add jenkins to the Docker group
RUN usermod -aG docker jenkins

# This looks weird, it is gid 998
RUN usermod -aG ssh_keys jenkins

# Switch back to the jenkins user.
USER jenkins

