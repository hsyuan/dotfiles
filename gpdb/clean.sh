rm -rf /tmp/.s.PGSQL.*
ps -ef | grep postgres |awk '{print $2}'|xargs  kill -9 {}
ps -ef | grep psql |awk '{print $2}'|xargs  kill -9 {}
ps -ef | grep initdb |awk '{print $2}'|xargs  kill -9 {}
ps -ef | grep gpstart |awk '{print $2}'|xargs  kill -9 {}
ps -ef | grep gpstop |awk '{print $2}'|xargs  kill -9 {}
SHMID=`ipcs -m | grep ${USER} | awk '{print $2}'`
if [ ! -z "${SHMID}" ] ; then
    for shmid in ${SHMID}; do
        echo "Deleting shmid ${shmid}"
        ipcrm -m ${shmid}
        if [ $? -ne 0 ] ; then
            echo "Error deleting shmid ${shmid}"
        fi
    done
fi

SEMID=`ipcs -s | grep ${USER} | awk '{print $2}'`
if [ ! -z "${SEMID}" ] ; then
    for semid in ${SEMID}; do
        echo "Deleting semid ${semid}"
        ipcrm -s ${semid}
        if [ $? -ne 0 ] ; then
            echo "Error deleting semid ${semid}"
        fi
    done
fi
