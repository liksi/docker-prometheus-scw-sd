#!/bin/bash

echo "$SCW_TOKEN" > /scw-token.txt

prometheus-scw-sd --output.file="./scw.json" --scw.token-file="/scw-token.txt"
