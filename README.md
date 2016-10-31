# swarm-sshd-centos

#
  mkdir /opt/store/share/peer/ssh -p
  
#
  nodeName='sshd'
  docker service create --name $nodeName --mount type=bind,source=/opt/store/share/peer/ssh,target=/root/.ssh --network swarm-network zerounnet/swarm-sshd-centos
