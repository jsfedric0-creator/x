#!/bin/bash

# بدء Nginx
nginx

# بدء Xtream-UI
if [ -f /home/xtreamcodes/iptv_xtream_codes/start_services.sh ]; then
    bash /home/xtreamcodes/iptv_xtream_codes/start_services.sh
else
    # إذا لم يكن Xtream-UI مثبتاً، قم بتثبيته
    wget -qO install.py https://raw.githubusercontent.com/masoudgb/Xtream-Ui/main/install.py
    python3 install.py --docker
fi

# ابقاء الحاوية نشطة
tail -f /dev/null
