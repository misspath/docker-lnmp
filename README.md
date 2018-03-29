## `Docker` 开发环境

### 软件版本

* php:7.2-fpm
* nginx:latest
* mysql:latest

### 选择性的安装和执行

* 安装 [`docker`](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce) && [`docker-compose`](https://docs.docker.com/compose/install/#install-compose) 软件。
* 参照 [`docker/README.md`](https://github.com/jtleon/docker/blob/master/docker/README.md) 文档安装 `Docker` 开发环境。
* `sudo docker-compose up -d` 启动开发环境。
* 连接数据库: `de-mysql -uroot -p123456`。
* 安装 `yii2-app-advanced` (在当前文档所在路径执行)：
    * `de-composer create-project --prefer-dist yiisoft/yii2-app-advanced project`；
    * `de-bash project/init`；
    * 修改 `project/common/config/main-local.php` 中相关配置；
    * `de-bash project/yiimigrate`
* 配置相应的 `hosts` 即可访问，端口均为 `81`。