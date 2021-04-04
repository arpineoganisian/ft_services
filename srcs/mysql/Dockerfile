FROM alpine:3.12.3

#first update the list of available packages and then upgrade the installed packages (= apk update && apk upgrade)
RUN apk -U upgrade 
RUN apk add vim mysql mysql-client openrc

COPY my.cnf /etc/mysql/

COPY start.sh ./

RUN chmod 755 start.sh

EXPOSE 3306

ENTRYPOINT sh start.sh

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