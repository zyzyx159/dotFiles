tomb="test.tomb"
tombKey="test.tomb.key"
loc="/home/zyzyx/"

cd ~

tomb dig -s 100 $tomb
sudo swapoff -a
tomb forge $tombKey
    # may need to use expect here to enter the password
tomb lock $tomb -k $tombKey
tomb open "$loc""$tomb" -k "$loc""$tombkey"

cd /media/RIP

# https://www.youtube.com/watch?v=1vVIpIvboSg

gpg --full-generate-key
    #may wamt to generate this key in the tomb
    #export GNUPGHOME=/media/RIP

    #https://superuser.com/questions/1003403/how-to-use-gpg-gen-key-in-a-script

1
4096
0
real name:
email address:
comment:
passphrase:
confirm passphrase:
