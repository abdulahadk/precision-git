CONTAINER=$1
filelines=`cat $CONTAINER_FOLDER/$CONTAINER/file.txt`
for line in $filelines ; do
    files=$(echo $line | cut -d ',' -f 1)
    echo $files
    echo 'sqlplus $USERNAME/$PASSWORD@$SID @'$CONTAINER_FOLDER/$CONTAINER/$files >> $CONTAINER_FOLDER/$CONTAINER/container.sh
done;
