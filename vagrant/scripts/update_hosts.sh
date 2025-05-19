#!/bin/bash

echo "Upate /etc/hosts.."
for j in {0..2} ; do
  cat /etc/hosts | grep -q controller-$j && continue
  echo "Adding controller-$j to hosts"
  sudo echo "192.168.100.1$j  controller-$j" >> /etc/hosts
done
for j in {0..2} ; do
 cat /etc/hosts | grep -q worker-$j && continue
  echo "Adding worker-$j to hosts"
  sudo echo "192.168.100.2$j  worker-$j" >> /etc/hosts
done
cat /etc/hosts | grep -q haproxy-lb || sudo echo 192.168.100.30 haproxy-lb >> /etc/hosts

