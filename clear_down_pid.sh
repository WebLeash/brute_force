
#!/usr/bin/env bash
# There are some issues with selenium and web-driver which is causing zoombie process left behind in the gocd environment.
# This is just a temporary fix to address the problem. (JIRA ID - WEB-320, WEB-321)

PIPELINE_NAME=$1
echo "********************************************************"
echo "GOCD Pipeline Name from argument $PIPELINE_NAME"
PARENT_PROCESS_IDS=($(pgrep -f "$PIPELINE_NAME"))
echo " Current Process ID $$"
echo "********************************************************"
echo "--------------------------------------------------------"
ps -ef|grep firefox
echo "--------------------------------------------------------"
echo "********************************************************"
for GPPID in "${PARENT_PROCESS_IDS[@]}"
        do
         echo "In for Loop with PID $GPPID"
         echo "Process Info $(ps -P $GPPID)"
         if [ $$ -ne "$GPPID" -a $PPID -ne "$GPPID" ]
         then
                echo "Parent ID :  $GPPID"
                CHILD_PIDS=$(pgrep -P "$GPPID")
                echo "Child Process Pending :  $CHILD_PIDS "
                echo "Child Process info $CHILD_PIDS "
                pkill -TERM -P $CHILD_PIDS
                kill -9 $CHILD_PIDS
                kill -9 $GPPID
         fi
done

echo "Completed Cleanup Process"
echo "********************************************************"