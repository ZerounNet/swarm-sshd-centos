# swarm-sshd-centos

#
  mkdir /opt/store/share/peer/ssh -p
  
#
  serviceName='sshd'

  imageName='zerounnet/swarm-sshd-centos'

  docker service create --name $serviceName --mount type=bind,source=/opt/store/share/peer/ssh,target=/root/.ssh --network swarm-network $imageName
