FROM ubuntu:24.04

# تثبيت المتطلبات
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    python3 \
    python3-pip \
    lsb-release \
    nginx \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# تنزيل وتثبيت Xtream-UI
RUN wget -qO /tmp/install.py https://raw.githubusercontent.com/masoudgb/Xtream-Ui/main/install.py && \
    python3 /tmp/install.py --docker --yes

# إنشاء مجلدات
RUN mkdir -p /home/xtreamcodes/iptv_xtream_codes/{logs,python,admin}

EXPOSE 80 25462 8000

CMD ["bash", "-c", "nginx && /home/xtreamcodes/iptv_xtream_codes/start_services.sh"]
