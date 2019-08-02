echo "********************************************************"
echo "Starting Service Registry"
echo "********************************************************"
java -Dspring.profiles.active=$PROFILE  \
     -jar /usr/local/registry/@project.build.finalName@.jar