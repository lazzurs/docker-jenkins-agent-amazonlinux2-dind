FROM ghcr.io/lazzurs/jenkins-agent-amazonlinux2

# Switch to root
USER root

# Add the ability to use PPAs
RUN amazon-linux-extras install docker

# Add jenkins to a relevant group and ID (YMMV, you may have to change the GID here...)
RUN yum install -y shadow-utils
RUN usermod -aG docker jenkins
RUN groupadd -g 998 debiandocker
RUN usermod -aG debiandocker jenkins

# Switch back to the jenkins user.
USER jenkins

