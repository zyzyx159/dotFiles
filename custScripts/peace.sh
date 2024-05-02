#!/bin/bash

tomb="/media/RIP/"
passLocation="jarjar/sudo"
pass=$(pass show $passLocation)
passExpect="[sudo] password for zyzyx:"

#unload my ssh keys
ssh-add -D

echo $pass | sudo -S umount $tomb

#slam the tomb
sudo tomb slam all
