----------------------------------------------------------------------------------------------------------------
INFRASTRUCTURE::KAFKA-CLUSTER PREPARATION

Reference:
https://blog.csdn.net/u012040869/article/details/82589002
https://blog.csdn.net/weixin_41452575/article/details/111193648

-Zookeeper-
SD1
cd /home/sundial/distributions/kafka_2.12-2.4.1.sd.1/bin
./zookeeper-server-start.sh ../config/1.sd.zookeeper.properties
SD4
cd /home/sundial/distributions/kafka_2.12-2.4.1.sd.2/bin
./zookeeper-server-start.sh ../config/2.sd.zookeeper.properties
SD5
cd /home/sundial/distributions/kafka_2.12-2.4.1.sd.3/bin
./zookeeper-server-start.sh ../config/3.sd.zookeeper.properties

-Kafka-
SD1
cd /home/sundial/distributions/kafka_2.12-2.4.1.sd.1/bin
./kafka-server-start-saal.sh ../config/server-sasl.properties
SD4
cd /home/sundial/distributions/kafka_2.12-2.4.1.sd.2/bin
./kafka-server-start-saal.sh ../config/server-sasl.properties
SD5
cd /home/sundial/distributions/kafka_2.12-2.4.1.sd.3/bin
./kafka-server-start-saal.sh ../config/server-sasl.properties

----------------------------------------------------------------------------------------------------------------
SD SUNDIAL CLUSTER

Reference:  https://medium.com/swlh/spring-cloud-high-availability-for-eureka-b5b7abcefb32

Eureka seamless
Eureka服务下线后快速感知配置 => https://www.jianshu.com/p/153bafe78ae7

—profile—
prodcluster

—启动配置中心—
SD1	& SD4 & SD5

nohup java -jar config-0.2.jar --spring.cloud.config.server.git.username=git --spring.cloud.config.server.git.password=tzbb2108 --spring.cloud.config.server.git.uri=ssh://git@gitlab.benbenedu.cn:/home/git/repositories/dev/sundial-config-repo.git &

—启动注册中心—
SD1
nohup java -jar registry-0.2.jar --spring.cloud.config.uri=http://psd1.benbenedu.cn:8888,http://psd4.benbenedu.cn:8888,http://psd5.benbenedu.cn:8888 --spring.profiles.active=prodcluster_sd1 &
SD4
nohup java -jar registry-0.2.jar --spring.cloud.config.uri=http://psd1.benbenedu.cn:8888,http://psd4.benbenedu.cn:8888,http://psd5.benbenedu.cn:8888 --spring.profiles.active=prodcluster_sd4 &
SD5
nohup java -jar registry-0.2.jar --spring.cloud.config.uri=http://psd1.benbenedu.cn:8888,http://psd4.benbenedu.cn:8888,http://psd5.benbenedu.cn:8888 --spring.profiles.active=prodcluster_sd5 &

-启动业务微服务群-
bash ./sd-cluster-sd1-startup
bash ./sd-cluster-sd4-startup
bash ./sd-cluster-sd5-startup