#!/bin/bash


timestamp=$(date +'%Y-%m-%d_%H-%M-%S')
#echo $timestamp
source=$1
echo "source is - $1"
backup_dir="${source}/backup_${timestamp}"

mkdir $backup_dir
#sudo cp -r /var/log/messages ${backup_dir}
echo "Backup Ceated $backup_dir"

rotating the backup files needs to be done...FYI
:<<'EOF'
#echo "$backup_dir" | wc -l

backups=$(ls -t "${source}/backup_")
num_backups=${#backups[@]}

#echo "backups is-$backups"

if [ "$num_backups" -gt 3 ];then
    # Loop through and delete older backup folders
    for ((i=3; i<$num_backups; i++)); do
        rm -rf "$source/${backups[i]}"
        echo "Removed older backup: ${backups[i]}"
    done
fi
EOF

