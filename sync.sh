#!/bin/sh
ORGUNIT=$1
TOKEN=$2
#SchedulerCli login -u admin -p admin
schedulercli sync $ORGUNIT --token $TOKEN