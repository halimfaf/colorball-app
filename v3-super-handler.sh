#!/bin/sh

# COLOR_CODE handler
echo "COLOR_CODE=$COLOR_CODE"
envsubst < /default.conf > /etc/nginx/conf.d/default.conf

#TSHOOT_BIGSIZE handler
if [ "$TSHOOT_BIGSIZE" = "yes" ]
then
    echo "TSHOOT_BIGSIZE=$TSHOOT_BIGSIZE - Troubleshooting mode - bigsize feature activated"
    for counter in $(seq 2664)
    do
        cp /usr/share/nginx/html/img/$COLOR_CODE.png /usr/share/nginx/html/img/image_part_$counter.png
    done
else
    echo "TSHOOT_BIGSIZE=$TSHOOT_BIGSIZE - Normal mode activated"
fi