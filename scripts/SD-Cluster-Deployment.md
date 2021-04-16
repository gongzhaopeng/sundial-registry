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