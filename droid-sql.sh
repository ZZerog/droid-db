#!/bin/bash

PACKAGE="<package>"
DATABASE="<database>"
LAUNCHER="sqlite3 -markdown"
PULL_DIR="./"


eval "adb -d shell 'run-as $PACKAGE cp /data/data/$PACKAGE/databases/$DATABASE /data/data/$PACKAGE/databases/$DATABASE-copy'"
if [ $? -ne 0 ]
then
echo "Error cloning database"
echo ""
exit 1
fi;

eval "adb -d shell 'run-as $PACKAGE chmod 666 /data/data/$PACKAGE/databases/$DATABASE-copy'"
if [ $? -ne 0 ]
then
echo "Error changing clone permission"
echo ""
exit 1
fi;

eval "adb -d shell 'run-as $PACKAGE cp /data/data/$PACKAGE/databases/$DATABASE-copy /sdcard/$DATABASE'"
if [ $? -ne 0 ]
then
echo "Error coping to /sdcard"
echo ""
exit 1
fi;

eval "adb -d shell 'run-as $PACKAGE rm /data/data/$PACKAGE/databases/$DATABASE-copy'"
if [ $? -ne 0 ]
then
echo "Error removing clone"
echo ""
exit 1
fi;

eval "adb -d pull /sdcard/$DATABASE $PULL_DIR"
if [ $? -ne 0 ]
then
echo "Error downloading"
echo ""
exit 1
fi;

eval "adb -d shell 'rm /sdcard/$DATABASE'"
if [ $? -ne 0 ]
then
echo "Error removing /sdcard copy"
echo ""
exit 1
fi;

${LAUNCHER} $DATABASE

exit 0
