#!/usr/bin/env bash

value=$(python3 -m mh_z19 | jq -r '.co2')

docker exec co2-database influx write \
	-b homelab \
	-o homelab \
	-p s \
	"co2PPM,location=home ppm=${value}"

