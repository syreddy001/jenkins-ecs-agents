FROM jenkins/jenkins:2.249.1-jdk11

COPY jenkins-resources/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY jenkins-resources/initialConfig.groovy /var/jenkins_home/init.groovy.d/initialConfigs.groovy
COPY jenkins-resources/jenkins.yaml /var/jenkins_home/jenkins.yaml
COPY jenkins-resources/slaveTestJob.xml /usr/share/jenkins/ref/jobs/slave-test/config.xml

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false