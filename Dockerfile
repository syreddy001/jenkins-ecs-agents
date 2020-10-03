FROM jenkins/jenkins:2.249.1-jdk11

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

COPY jenkins.yaml /var/jenkins_home/jenkins.yaml

COPY disable-script-security.groovy /var/jenkins_home/init.groovy.d/disable-script-security.groovy

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false