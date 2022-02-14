bdk network delete -n shell-network-ca -f
./cicd/test_script/ca.sh

# preupdate ca
BDK_NETWORK_NAME=shell-network-ca bdk ca preupdate --ca-name ica.org0.bdk.example.com

# preupdate channel
NODE_ENV=development BDK_NETWORK_NAME=shell-network-ca BDK_ORG_NAME=Org0 BDK_HOSTNAME=peer0 BDK_ORG_DOMAIN=org0.bdk.example.com BDK_ORG_TYPE=peer bdk peer cert preupdate -i

# approve
NODE_ENV=development BDK_NETWORK_NAME=shell-network-ca BDK_ORG_NAME=Org0 BDK_HOSTNAME=peer0 BDK_ORG_DOMAIN=org0.bdk.example.com BDK_ORG_TYPE=peer bdk channel approve -i

NODE_ENV=development BDK_NETWORK_NAME=shell-network-ca BDK_ORG_NAME=Org1 BDK_HOSTNAME=peer0 BDK_ORG_DOMAIN=org1.bdk.example.com BDK_ORG_TYPE=peer bdk channel approve -i

NODE_ENV=development BDK_NETWORK_NAME=shell-network-ca BDK_ORG_NAME=Org2 BDK_HOSTNAME=peer0 BDK_ORG_DOMAIN=org2.bdk.example.com BDK_ORG_TYPE=peer bdk channel approve -i

# commit
NODE_ENV=development BDK_NETWORK_NAME=shell-network-ca BDK_ORG_NAME=Org0 BDK_HOSTNAME=peer0 BDK_ORG_DOMAIN=org0.bdk.example.com BDK_ORG_TYPE=peer bdk channel update -i

# postupdate ca
BDK_NETWORK_NAME=shell-network-ca bdk ca postupdate --ca-name ica.org0.bdk.example.com

# enroll
NODE_ENV=development BDK_NETWORK_NAME=shell-network-ca bdk ca enroll -t peer -u ica.org0.bdk.example.com -p 7154 --client-id peer0.org0.bdk.example.com --client-secret org0peerpw --role peer --org-hostname org0.bdk.example.com

# reenroll
NODE_ENV=development BDK_NETWORK_NAME=shell-network-ca bdk ca reenroll -t peer -u ica.org0.bdk.example.com --client-id peer0.org0.bdk.example.com -r peer -h peer0.org0.bdk.example.com

# restart peer