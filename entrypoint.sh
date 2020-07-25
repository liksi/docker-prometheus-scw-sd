#!/bin/bash

echo "$SCW_TOKEN" > /config/scw-token.txt

prometheus-scw-sd --output.file="./scw.json" --scw.token-file="/config/scw-token.txt"
