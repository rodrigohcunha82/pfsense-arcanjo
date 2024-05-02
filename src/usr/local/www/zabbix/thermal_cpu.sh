discovery_all () {
    SENSOR_ALL=$(sysctl -a | grep ".temperature.*" | cut -d":" -f1)
    SENSOR_JSON=""
    for SENSOR in $SENSOR_ALL
        do
            SENSOR_JSON="$SENSOR_JSON{\"{#SENSOR_NAME}\":\"$SENSOR\"},"
    done
    SENSOR_JSON="{\"data\":[$SENSOR_JSON]}"
    echo $SENSOR_JSON
}

sensor () {
    SENSOR_JSON=""
    SENSOR_JSON=$(sysctl -n $1)
    echo $SENSOR_JSON
}

case "$1" in
    "discovery")
        discovery_all
        ;;
    "sensor")
        sensor $2
        ;;
esac
