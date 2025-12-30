# RAGFlow for ACR
```bash
docker pull registry.cn-hangzhou.aliyuncs.com/YOUR_NAMESPACE/ragflow:v0.10.0

## 第二部分：配置ACR连接GitHub（与MySQL流程完全相同）

### 2.1 授权ACR访问GitHub
1. 登录 [阿里云ACR控制台](https://cr.console.aliyun.com)
2. 点击「创建镜像仓库」
3. 在代码源部分，点击「GitHub」→「前往授权」
4. 在GitHub授权页面点击「Authorize aliyuncontainerservice」
5. 授权成功后返回ACR

### 2.2 创建镜像仓库
填写仓库信息：
仓库名称：ragflow
仓库类型：私有
摘要：RAGFlow (AI知识库) Docker image
仓库地址：选择默认实例（如registry.cn-hangzhou.aliyuncs.com）

代码源配置：
代码源：GitHub
命名空间：选择 wrjicediamond（你的GitHub用户名）
代码仓库：选择 ragflow-acr-build
默认分支：main


镜像构建配置：
构建目录：留空（仓库根目录）
Dockerfile路径：Dockerfile
镜像版本：v0.10.0


### 2.3 配置构建规则（使用你的截图界面）
根据你的截图界面配置：
Branch/Tag: main
类型：Branch
镜像版本：v0.10.0
✅ 代码变更自动构建镜像
□ 海外机器构建
□ 不使用缓存

构建上下文目录：（留空）
Dockerfile：Dockerfile


点击「确定」保存

## 第三部分：触发构建和验证（与MySQL流程相同）

### 3.1 立即触发首次构建
1. 在构建规则页面点击「立即构建」
2. 选择分支：`main`
3. 点击「确定」

### 3.2 查看构建日志
等待构建完成，查看日志确认成功：
#1 FROM infiniflow/ragflow:v0.10.0
#2 ENV TZ=Asia/Shanghai
#3 RUN ln -snf /usr/share/zoneinfo/$TZ...
构建成功！


### 3.3 验证镜像已创建
1. 返回仓库首页
2. 点击「镜像版本」
3. 看到标签为「v0.10.0」的RAGFlow镜像

## 第四部分：使用RAGFlow镜像

### 4.1 从ACR拉取镜像
```bash
# 登录ACR（如果需要）
docker login --username=你的ACR用户名 registry.cn-hangzhou.aliyuncs.com

# 拉取RAGFlow镜像
docker pull registry.cn-hangzhou.aliyuncs.com/你的命名空间/ragflow:v0.10.0
