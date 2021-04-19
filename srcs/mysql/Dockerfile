FROM alpine:3.12.3

#first update the list of available packages and then upgrade the installed packages (= apk update && apk upgrade)
RUN apk -U upgrade 
RUN apk add mysql mysql-client openrc 
RUN apk add supervisor
RUN apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community

COPY supervisord.conf /etc/supervisord.conf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY my.cnf /etc/mysql/

COPY wordpress.sql ./
RUN chmod 755 wordpress.sql

COPY start.sh ./
RUN chmod 755 start.sh

# RUN /bin/sh /start.sh

# VOLUME [ "/sys/fs/cgroup" ]

EXPOSE 3306

CMD supervisord -c /etc/supervisord.conf


# В приведенных ниже таблицах показано, какая команда выполняется для различных комбинаций ENTRYPOINT / CMD :

# -- No ENTRYPOINT
# ╔════════════════════════════╦═════════════════════════════╗
# ║ No CMD                     ║ error, not allowed          ║
# ╟────────────────────────────╫─────────────────────────────╢
# ║ CMD [“exec_cmd”, “p1_cmd”] ║ exec_cmd p1_cmd             ║
# ╟────────────────────────────╫─────────────────────────────╢
# ║ CMD [“p1_cmd”, “p2_cmd”]   ║ p1_cmd p2_cmd               ║
# ╟────────────────────────────╫─────────────────────────────╢
# ║ CMD exec_cmd p1_cmd        ║ /bin/sh -c exec_cmd p1_cmd  ║
# ╚════════════════════════════╩═════════════════════════════╝

# -- ENTRYPOINT exec_entry p1_entry
# ╔════════════════════════════╦══════════════════════════════════╗
# ║ No CMD                     ║ /bin/sh -c exec_entry p1_entry   ║
# ╟────────────────────────────╫──────────────────────────────────╢
# ║ CMD [“exec_cmd”, “p1_cmd”] ║ /bin/sh -c exec_entry p1_entry   ║
# ╟────────────────────────────╫──────────────────────────────────╢
# ║ CMD [“p1_cmd”, “p2_cmd”]   ║ /bin/sh -c exec_entry p1_entry   ║
# ╟────────────────────────────╫──────────────────────────────────╢
# ║ CMD exec_cmd p1_cmd        ║ /bin/sh -c exec_entry p1_entry   ║
# ╚════════════════════════════╩══════════════════════════════════╝

# -- ENTRYPOINT [“exec_entry”, “p1_entry”]
# ╔════════════════════════════╦═════════════════════════════════════════════════╗
# ║ No CMD                     ║ exec_entry p1_entry                             ║
# ╟────────────────────────────╫─────────────────────────────────────────────────╢
# ║ CMD [“exec_cmd”, “p1_cmd”] ║ exec_entry p1_entry exec_cmd p1_cmd             ║
# ╟────────────────────────────╫─────────────────────────────────────────────────╢
# ║ CMD [“p1_cmd”, “p2_cmd”]   ║ exec_entry p1_entry p1_cmd p2_cmd               ║
# ╟────────────────────────────╫─────────────────────────────────────────────────╢
# ║ CMD exec_cmd p1_cmd        ║ exec_entry p1_entry /bin/sh -c exec_cmd p1_cmd  ║
# ╚════════════════════════════╩═════════════════════════════════════════════════╝