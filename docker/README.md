## 开发环境

`Ubuntu` `Nginx` `Mysql` `PHP7`

## 安装步骤

* 提示! 你可能需要修改以下配置
    
    * 文件 `php/Dockerfile`
    
        > 如果你是 `Mac OSX` 安装的桌面版 `docker` ，你需要用 `15` 行替代掉 `12` 行，否则 `fpm` 可能会出现权限不足的提示
    
    * 文件 `docker-compose.yml`
    
        * 各个服务端口号
        * 数据库管理员密码
        * 所有挂载卷
        * 添加需要的环境变量
        
* 非必须运行的命令（安装一些帮助命令）

    * chmod a+x script/*.sh
    * 安装任意你需要的相关命令
    
        * `library.sh` 包含一些帮助函数，如果不希望安装以下其他命令时也可以单独执行，将为你创建 `fpm`、`mysql` 和 `nginx` 三个容器的便捷入口命令，方便调试。
        
            * `de-container-fpm bash` 便捷进入 `fpm` 容器，`bash` 可替换成任意 `linux` 命令执行
            * `de-container-mysql bash` 便捷进入 `mysql` 容器，同上
            * `de-container-nginx bash` 便捷进入 `nginx` 容器，同上
        
        * `install-bash.sh` 生成命令：
        
            * `de-bash` 替代 `bash`。
        
        * `install-composer.sh` 生成命令：
        
            * `de-composer` 完全替代 `composer`。
            
                > 如若安装依赖有环境要求，可使用以下命令绕过要求  
                > `de-composer [install | require] [package name] --ignore-platform-reqs`
        
        * `install-front.sh` 生成前端相关命令：
            
            * `de-node` 完全替代 `nodejs`
            * `de-npm` 完全替代 `npm`
            * `de-cnpm` 完全替代 `cnpm` （国内淘宝团队镜像）
        
        * `install-mysql-client.sh` 数据库相关命令：
        
            * `de-mysql` 完全替代 `mysql`
            * `de-mysqldump` 完全替代 `mysqldump`

* sudo docker-compose up --build

    > 提示! 如果你的 `build` 操作过慢，你可前往 [daocloud](https://www.daocloud.io) 注册并获取加速方式，如果你是 `linux`, 则类似
    >
    > ```
    > curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://{YOU-SELF-ID}.m.daocloud.io
    > ```
    >
    > 警告! 本架构编译大概需要 `15` 分钟左右。
    > 如果因网络问题失败，请重新执行命令。

## 作者

* jiangxilee@gmail.com
* [GitHub](https://github.com/jtleon)

