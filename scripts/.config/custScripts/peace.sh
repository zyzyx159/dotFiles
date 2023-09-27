#!/bin/bash

tomb="/media/RIP/"
passLocation="jarjar/sudo"
pass=$(pass show $passLocation)
passExpect="[sudo] password for zyzyx:"

#unload my ssh keys
ssh-add -D

echo $pass | sudo -S umount $tomb

#expect -f - <<-EOF
#	  spawn sudo umount $tomb
#	  expect "$passExpect"
#	  send -- "$pass\r"
#	  expect eof
#EOF

#slam the tomb
sudo tomb slam all
#tomb slam all # it does not work the first time
