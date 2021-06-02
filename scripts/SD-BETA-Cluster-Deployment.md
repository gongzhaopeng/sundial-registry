----------------------------------------------------------------------------------------------------------------
SD-BETA SUNDIAL CLUSTER

Reference:  https://medium.com/swlh/spring-cloud-high-availability-for-eureka-b5b7abcefb32

Eureka seamless
Eureka服务下线后快速感知配置 => https://www.jianshu.com/p/153bafe78ae7

—profile—
cluster

—启动配置中心—
SD3	& SD6

nohup java -jar config-0.2.jar --spring.cloud.config.server.git.username=git --spring.cloud.config.server.git.password=tzbb2108 --spring.cloud.config.server.git.uri=ssh://git@gitlab.benbenedu.cn:/home/git/repositories/dev/sundial-config-repo.git &

—启动注册中心—
SD3
nohup java -jar registry-0.2.jar --spring.cloud.config.uri=http://psd3.benbenedu.cn:8888,http://psd6.benbenedu.cn:8888 --spring.profiles.active=cluster_sd3 &
SD6
nohup java -jar registry-0.2.jar --spring.cloud.config.uri=http://psd3.benbenedu.cn:8888,http://psd6.benbenedu.cn:8888 --spring.profiles.active=cluster_sd6 &

-启动业务微服务群-
bash ./sd-beta-cluster-sd3-startup
bash ./sd-beta-cluster-sd6-startup