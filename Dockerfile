FROM mysql:8

LABEL author="ZCQ"
LABEL email="1229896069@qq.com"
LABEL version="1.0"
LABEL description="mysql uesd for oai project"
LABEL reference="宿主机通过mysql -u root -p$MYSQL_ROOT_PASSWORD访问docker中的MySQL会报错：\
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)\
原因是mysql支持socket和TCP/IP连接,连接数据库使用的主机名参数为“localhost”,或者未使用主机名参数,\
服务器默认使用“localhost”做为主机名.使用主机名参数为“localhost”连接mysql服务端时，\
mysql客户端会认为是连接本机，所以会尝试以socket文件方式进行连接(socket文件连接方式，比“TCP/IP连接”方式效率更高)\
解决方案:(1)mysql -u root -p$MYSQL_ROOT_PASSWORD -h 127.0.0.1\
        (2)docker run -itd --name 容器名 -p 3306:3306 --net=host 镜像名"

# 配置MySQL的root密码
ENV MYSQL_ROOT_PASSWORD 123456
# 配置MySQL使所有用户能访问
ENV MYSQL_ROOT_HOST '%'
# 创建数据库mybatis
ENV MYSQL_DATABASE mytestdb
# 创建用户user,会自动给user用户数据库mybatis的权限
ENV MYSQL_USER user
# 配置user的密码
ENV MYSQL_PASSWORD 123456

#定义工作目录
ENV WORK_PATH /usr/local/work
#定义会被容器自动执行的目录
ENV AUTO_RUN_DIR /docker-entrypoint-initdb.d
#定义sql文件名
ENV FILE_0 measure.sql
ENV FILE_1 total_recv.sql
ENV FILE_2 total_send.sql
ENV FILE_3 total.sql
ENV FILE_4 delayloss.sql

#定义shell文件名
ENV INSTALL_DATA_SHELL install_data.sh
#创建文件夹
RUN mkdir -p $WORK_PATH
#把数据库初始化数据的文件复制到工作目录下
COPY ./$FILE_0 $WORK_PATH/
COPY ./$FILE_1 $WORK_PATH/
COPY ./$FILE_2 $WORK_PATH/
COPY ./$FILE_3 $WORK_PATH/
COPY ./$FILE_4 $WORK_PATH/

#把要执行的shell文件放到/docker-entrypoint-initdb.d/目录下，容器会自动执行这个shell
COPY ./$INSTALL_DATA_SHELL $AUTO_RUN_DIR/
#声明暴露端口
EXPOSE 3306
#给执行文件增加可执行权限
RUN chmod a+x $AUTO_RUN_DIR/$INSTALL_DATA_SHELL