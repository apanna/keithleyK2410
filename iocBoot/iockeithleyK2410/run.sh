#!/bin/sh 
chmod +x st.cmd
sudo procServ --allow -n "KEITHLEY-SOURCE" -p pid.txt -L log.txt --logstamp -i ^D^C 2008 ../../bin/$EPICS_HOST_ARCH/keithleyK2410 st.cmd
sleep 10
