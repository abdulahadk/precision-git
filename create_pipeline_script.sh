PIPELINE=$1
filelines=`cat $PIPELINE_FOLDER/$PIPELINE.txt`
for container in $filelines ; do
    echo $container
    $PRECISION100_FOLDER/create_container_script.sh $container
    echo "$CONTAINER_FOLDER/$container".sh >> $PIPELINE_FOLDER/$PIPELINE.sh
done;
