FROM ubuntu:22.04

# تثبيت المتطلبات الأساسية
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    python3 \
    python3-pip \
    nginx \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# تنزيل Xtream-UI
RUN wget -qO /tmp/install.py https://raw.githubusercontent.com/masoudgb/Xtream-Ui/main/install.py

# تشغيل التثبيت (داخل Docker)
RUN python3 /tmp/install.py --docker

# نسخ إعدادات Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# إنشاء مجلدات
RUN mkdir -p /home/xtreamcodes/iptv_xtream_codes/{logs,python,admin,covers,streams}

EXPOSE 80 25462 8000 8443

# تشغيل Xtream-UI
CMD ["bash", "-c", "service nginx start && /home/xtreamcodes/iptv_xtream_codes/start_services.sh"]
