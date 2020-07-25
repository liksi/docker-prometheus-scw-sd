#!/bin/bash

echo "$SCW_TOKEN" > token.txt

prometheus-scw-sd --output.file="./scw.json" --scw.token-file="token.txt"
