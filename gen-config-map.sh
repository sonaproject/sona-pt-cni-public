#!/bin/sh

CONFIG_MAP_FILE=/tmp/sona-pt-cm.yaml

if [ "$#" -lt 3 ]; then
    echo "$# is Illegal number of parameters."
    echo "Usage: $0 ONOS_IP OVERLAY_TYPE SEGMENT_ID"
	exit 1
fi

ONOS_IP=$1
OVERLAY_TYPE=$2
SEGMENT_ID=$3

cat > $CONFIG_MAP_FILE << EOF
---
apiVersion: v1
data:
  OnosIP: $ONOS_IP
  OverlayType: $OVERLAY_TYPE
  SegmentID: "$SEGMENT_ID"
kind: ConfigMap
metadata:
  name: install-config
  namespace: kube-system
EOF

cat $CONFIG_MAP_FILE

exit 0
