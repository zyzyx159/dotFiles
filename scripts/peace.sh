#!/bin/bash

tomb="/media/RIP/"
passLocation="jarjar/sudo"
pass=$(pass show $passLocation)

#unload my ssh keys
ssh-add -D

#slam the tomb
tomb slam all
tomb slam all # it does not work the first time
