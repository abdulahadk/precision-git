
filelines=`cat $MIGRATION_FOLDER/$MIGRATION.txt`
for pipeline in $filelines ; do
    echo $pipeline
    $PRECISION100_FOLDER/create_pipeline_script.sh $pipeline
    echo "$PIPELINE_FOLDER/$pipeline".sh >> $MIGRATION_FOLDER/$MIGRATION.sh
done;
