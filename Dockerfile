FROM ghcr.io/amachsoftware/jenkins-agent-amazonlinux2

# Switch to root
USER root

# Add the ability to use PPAs
RUN amazon-linux-extras install docker

# Add jenkins to the Docker group
RUN usermod -aG docker jenkins

# This looks weird, it is gid 998
RUN usermod -aG ssh_keys jenkins

# Switch back to the jenkins user.
USER jenkins

