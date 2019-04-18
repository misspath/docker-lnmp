## `Docker` 开发环境

### 软件版本

* php: 5.6/7.3
* nginx: latest
* mysql: 5.7

### 选择性的安装和执行

* 安装 [`docker`](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce) 和 [`docker-compose`](https://docs.docker.com/compose/install/#install-compose) 软件。
* 参照 [`docker/README.md`](https://github.com/jtleon/docker/blob/master/docker/README.md) 文档安装 `Docker` 开发环境。
* `sudo docker-compose up -d` 启动开发环境。
* 连接数据库: `app-mysql -uroot -p123456`。
* 安装 `yii2-app-advanced` (在当前文档所在路径执行)：
    * `app-composer create-project --prefer-dist yiisoft/yii2-app-advanced app`；
    * `app-bash project/init`；
    * 修改 `app/common/config/main-local.php` 中相关配置；
    * `app-bash project/yii` 列表可用命令。
* 配置相应的 `hosts` 即可访问，端口默认均为 `80`。
    ```
    192.168.1.2 free.com
    192.168.1.2 frontend.app.com
    192.168.1.2 backend.app.com
    ```