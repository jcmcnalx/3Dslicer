#1/bin/bash
cp Dockerfile Dockerfile.preid
export uid=${uid} group=$(id -g) username=$(id -un)
sed -i "s/userid/${uid}/g" Dockerfile
sed -i "s/groupid/$group/g" Dockerfile
sed -i "s/username/$username/g" Dockerfile
#echo ${uid} > uid
#echo $group > gid
#echo $username > user
