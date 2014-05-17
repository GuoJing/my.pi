#!/bin/bash
# this is a python script wrapper of monit

PIDFILE=/tmp/web.pid

case $1 in
   start)
      echo $$ > ${PIDFILE};
      source /home/work/venv/bin/activate
      exec python /home/work/web/web.py >/dev/null
   ;;
   stop)
      kill `cat ${PIDFILE}` && rm ${PIDFILE};;
   *)
      echo "usage: scraper {start|stop}" ;;
esac
exit 0
