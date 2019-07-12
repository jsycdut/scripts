# README

V2ray server side and client side scripts.

包含v2ray的客户端和服务端搭建基础流程，服务端安装使用的是获取源码编译安装同时加上服务自动启动的形式，客户端则是采用包管理器安装客户端同时加上服务自启动的操作。

服务端服务的名称为`v2ray-server`，客户端服务的名称为`v2ray-client`

```bash
$ systemctl status v2ray-client
● v2ray-client.service - Simple V2ray Client Service
   Loaded: loaded (/usr/lib/systemd/system/v2ray-client.service; enabled; vendor preset: disabled)
   Active: active (running) since Tue 2019-07-09 09:01:51 CST; 58min ago
 Main PID: 25920 (v2ray)
    Tasks: 9 (limit: 1134)
   Memory: 14.5M
   CGroup: /system.slice/v2ray-client.service
           └─25920 /usr/bin/v2ray -config /etc/v2ray/config.json
```

## 搭建服务端

```bash
$ sudo bash server.sh
```

注意在安装完成开启BBR，这样网络速度会优化一些。

## 搭建客户端

```bash
$ sudo bash client.sh
```

注意修改配置文件`/etc/v2ray/config.json`，把IP地址改成服务器端的IP地址，端口也一样。同时`systemctl restart v2ray-client`

## TODO

- [x] 服务自启动
- [ ] 服务器端bbr检测和使用
- [ ] 客户端安装时索要服务器端IP，免去之后手动配置
- [ ] 客户端使用privoxy提供http代理

## 银弹？？
选个延迟低一点的节点比什么加速技术都强...

## 羊毛
一些VPS厂家提供了新用户优惠，通过下面的链接注册新账号并激活就可以获取对应的优惠链接，当然，除了下面的俩，还有Google Cloud Platform提供的300$优惠，不过那个不太容易搞。

* [Vultr 10$ 优惠注册链接](https://www.vultr.com/?ref=7171540)
* [Digital Ocean 50$ 优惠注册链接](https://m.do.co/c/35b1ee44c559)
