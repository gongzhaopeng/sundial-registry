----------------------------------------------------------------------------------------------------------------
INFRASTRUCTURE::KAFKA PREPARATION

Reference:
https://blog.csdn.net/u012040869/article/details/82589002
https://blog.csdn.net/weixin_41452575/article/details/111193648

-Zookeeper-
SD1
cd /home/sundial/distributions/kafka_2.12-2.4.1/bin
./zookeeper-server-start.sh ../config/zookeeper.properties

-Kafka-
SD1
cd /home/sundial/distributions/kafka_2.12-2.4.1/bin
./kafka-server-start-saal.sh ../config/server-sasl.properties

----------------------------------------------------------------------------------------------------------------
SD1 SUNDIAL NEWPROD

Reference:  https://medium.com/swlh/spring-cloud-high-availability-for-eureka-b5b7abcefb32

Eureka seamless
Eureka服务下线后快速感知配置 => https://www.jianshu.com/p/153bafe78ae7

—profile—
newprod

—启动配置中心—
SD1

nohup java -jar config-0.2.jar --spring.cloud.config.server.git.username=git --spring.cloud.config.server.git.password=tzbb2108 --spring.cloud.config.server.git.uri=ssh://git@gitlab.benbenedu.cn:/home/git/repositories/dev/sundial-config-repo.git &

-启动业务微服务群-
bash ./sundial-newprod-startup