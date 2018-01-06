# SSL证书颁发工具

这个工程构建了一系列脚本工具，用来管理SSL证书的相关事宜。

### Install

将工程`git clone`下来，然后运行

```bash
sudo ./install.sh -l
```

或者直接运行

```Bash
bash <(curl https://github.com/huangy10/quick-ca-signer/raw/master/install.sh)
```

这个命令会自动拉取相关代码并完成安装。

安装完成后应该就能使用`woodyssl`命令了。使用方法查看`woodyssl -h`

### Quick Start

```bash
$ woodyssl -c -subj "/C=CN/ST=Beijing/L=Beijing/O=Tsinghua/CN=Vlion Club"
$ woodyssl -c -d yourdomain.com
$ woodyssl -l
yourdomain.com
$ woodyssl -d yourdomain.com -e path/to/export/certficates
```

### Advanced Usage

导出根证书

```bash
$ woodyssl -e path/to/export/root-ca
```



导入已经存在的根证书

```bash
$ woodyssl --ca path/to/root-ca -i
```

注意这里要求根证书相关文件命名为`root-ca.crt`和`root-ca.key`。你也可以不导入直接从指定根证书上创建站点证书

```bash
$ woodyssl -d yourdomain.com -c --ca path/to/root-ca
```

