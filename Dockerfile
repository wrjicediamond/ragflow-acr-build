# 使用RAGFlow官方镜像
FROM infiniflow/ragflow:v0.10.0

# 设置维护者信息
LABEL maintainer="wrjicediamond"
LABEL version="1.0"
LABEL description="RAGFlow Docker image for ACR"

# 设置时区为上海
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 复制自定义配置文件（如果需要）
COPY config/application.yml /opt/ragflow/conf/

# 健康检查
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:9380/api/v1/health || exit 1

# 暴露端口
EXPOSE 9380

# 使用官方entrypoint
ENTRYPOINT ["/opt/ragflow/start.sh"]
