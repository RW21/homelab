#! /bin/env bash

curl -sfL https://get.k3s.io |  K3S_URL="https://192.168.193.179:6443" K3S_NODE_NAME=outpost-node K3S_TOKEN="" INSTALL_K3S_EXEC="--node-external-ip 192.168.193.38 --node-ip 192.168.193.38" sh -