FROM ghcr.io/lazzurs/jenkins-agent-amazonlinux2

# Switch to root
USER root

# Add the ability to use PPAs
RUN amazon-linux-extras install docker

# Switch back to the jenkins user.

USER jenkins

