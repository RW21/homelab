#! /bin/env bash

curl -sfL https://get.k3s.io | K3S_NODE_NAME=master-node INSTALL_K3S_EXEC="--write-kubeconfig ~/.kube/config --write-kubeconfig-mode 666 --node-external-ip 192.168.193.179 --tls-san 192.168.193.179" sh  -

sudo cat /var/lib/rancher/k3s/server/node-token
