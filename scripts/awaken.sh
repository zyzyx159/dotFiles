#!/bin/bash

tomb="~/RIP.tomb"
tombKey="~/RIP.tomb.key"
passLocation="ssh/zyzyx"
sshKeyLocation="/media/RIP/ssh/zyzyx"

tomb open $tomb -k $tombKey -f

pass=$(pass show $passLocation)

expect <<EOF
  spawn ssh-add $sshKeyLocation
  expect "Enter passphrase"
  send "$pass\r"
  expect eof
EOF
