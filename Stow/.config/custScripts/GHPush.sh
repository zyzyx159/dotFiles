#!/bin/bash

#make file
echo -n "$1 $2 $3" > pubkey.pub

#GH push file
gh ssh-key add pubkey.pub -t $4

#delete file
rm pubkey.pub