#!/bin/sh
ORGUNIT=$1
TOKEN=$2
#SchedulerCli login -u admin -p admin
SchedulerCli sync $ORGUNIT --token $TOKEN