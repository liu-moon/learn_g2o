# README

记录g2o的安装、基本概念、曲线拟合以及二元边的相关教程

## 安装

系统：Ubuntu
g2o版本：20230806

在 Ubuntu 中安装 g2o 到指定目录 `/usr/local/g2o_2308`

1. **克隆 g2o 仓库**

    ```bash
    git clone --branch 20230806_git --single-branch https://github.com/RainerKuemmerle/g2o.git
    ```

2. **创建并进入build目录**

   ```bash
   mkdir build
   cd build
   ```

3. **配置 CMake**

   ```bash
   cmake -DCMAKE_INSTALL_PREFIX=/usr/local/g2o_2308 ..
   ```

4. **编译**

   ```bash
   make -j$(nproc)
   ```

5. **安装**

   ```bash
   sudo make install
   ```


## 环境问题

```shell
./bin/sba_demo: error while loading shared libraries: libg2o_opengl_helper.so.0.1: cannot open shared object file: No such file or directory
```

将库路径添加到系统搜索路径

编辑动态链接器的配置文件，将库路径永久添加到搜索路径中：

1. 打开 /etc/ld.so.conf.d/ 下的一个配置文件（或创建一个新的配置文件）：

```shell
sudo nano /etc/ld.so.conf.d/g2o.conf
```

2. 添加以下内容：

```shell
/usr/local/g2o_2308/lib
```

3. 更新动态链接器缓存：

```shell
sudo ldconfig
```

4. 验证是否已添加：

```shell
ldconfig -p | grep libg2o_opengl_helper
```
如果显示了正确的路径，说明配置已生效。
