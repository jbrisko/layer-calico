#!/bin/sh
set -eux

rm -rf resource-build
mkdir resource-build
cd resource-build
wget https://github.com/projectcalico/calicoctl/releases/download/v3.1.3/calicoctl
wget https://github.com/projectcalico/cni-plugin/releases/download/v3.1.3/calico
wget https://github.com/projectcalico/cni-plugin/releases/download/v3.1.3/calico-ipam
chmod +x calicoctl calico calico-ipam

mkdir temp
(cd temp
  wget https://github.com/containernetworking/plugins/releases/download/v0.7.1/cni-plugins-amd64-v0.7.1.tgz
  tar -vxf cni-plugins-amd64-v0.7.1.tgz
  mv portmap ..
)
rm -rf temp

tar -vcaf ../calico-resource.tar.gz .
cd ..
rm -rf resource-build
