FROM openjdk:11
RUN mkdir -p /usr/local/registry
ADD @project.build.finalName@.jar /usr/local/registry/
ADD run.sh run.sh
RUN chmod +x run.sh
CMD ./run.sh