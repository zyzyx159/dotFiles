#!/bin/bash

tomb="/media/RIP/"
passLocation="jarjar/sudo"
pass=$(pass show $passLocation)

#unload my ssh keys
ssh-add -D

expect -f - <<-EOF
	  set timeout 10
	    spawn sudo -k
	  spawn sudo umount $tomb
	  expect "*?assword*"
	  send -- "$pass\r"
	  expect eof 
EOF

#slam the tomb
sudo tomb slam all
#tomb slam all # it does not work the first time
