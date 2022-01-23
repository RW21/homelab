#!/usr/bin/env python3

import time
import os
import cgsensor

from datetime import datetime

from influxdb_client import InfluxDBClient, Point, WritePrecision
from influxdb_client.client.write_api import SYNCHRONOUS

# You can generate an API token from the "API Tokens Tab" in the UI
token = os.getenv('INFLUX_KEY')
org = "homelab"
bucket = "home"

# Initialise the BME280
bme280 = cgsensor.BME280(i2c_addr=0x76)
bme280.forced()

temperature = bme280.temperature
pressure = bme280.pressure
humidity = bme280.humidity

with InfluxDBClient(url="http://192.168.193.179:32481", token=token, org=org) as client:
    data = 'BME280,sensor=bme280 celsius={:05.2f},hPa={:05.2f},humidity={:02.2f}'.format(temperature, pressure, humidity)

    write_api = client.write_api(write_options=SYNCHRONOUS)
    write_api.write(bucket, org, data)

