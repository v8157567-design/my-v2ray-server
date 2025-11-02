FROM alpine:3.18

RUN apk add --no-cache ca-certificates curl tzdata unzip

WORKDIR /app

# Скачиваем последнюю версию Xray
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip xray.zip -d /app \
    && rm xray.zip

COPY config.json /app/config.json
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 8080

CMD ["/app/start.sh"]
