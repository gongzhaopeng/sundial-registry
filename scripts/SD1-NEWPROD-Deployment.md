----------------------------------------------------------------------------------------------------------------
SD SUNDIAL CLUSTER

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