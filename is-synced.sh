#! /bin/sh

# confirm that the node is fully synced and exit once synced with pause of 5s
while : 
do
  sync_info=`axelarcli status | grep catching_up`
  echo "$sync_info"
  if [ "$sync_info" != "${sync_info%"false"*}" ]; then
    echo "Caught up"
    break
  fi
  sleep 5
done