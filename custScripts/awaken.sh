#!/bin/bash

tomb="/home/zyzyx/RIP.tomb"
tombKey="/home/zyzyx/RIP.tomb.key"
passLocation="ssh/zyzyx"
sshKeyLocation="/media/RIP/ssh/zyzyx"

sudo swapoff -a

tomb open $tomb -k $tombKey

pass=$(pass show $passLocation)

expect <<EOF
  spawn ssh-add $sshKeyLocation
  expect "Enter passphrase"
  send "$pass\r"
  expect eof
EOF

sudo swapon -a
