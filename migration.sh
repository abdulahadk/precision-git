SCRIPT="${BASH_SOURCE[0]}"
SOURCE=`dirname "${BASH_SOURCE[0]}"`

source .env.sh

export MIGRATION=$1
export ITERATION=$2
export SPOOL_PATH="$SPOOL_PATH/$ITERATION"
export SQLLDR_LOG="$SQLLDR_LOG/$ITERATION"
export SQLLDR_BAD="$SQLLDR_BAD/$ITERATION"
export GIT_WORK_AREA="$GIT_LOCAL_FOLDER/$ITERATION"
export MIGRATION_SCRIPT="$MIGRATION.sh"

mkdir "$SPOOL_PATH"
mkdir "$SQLLDR_LOG"
mkdir "$SQLLDR_BAD"
mkdir "$GIT_LOCAL_FOLDER"

git clone "$GIT_URL" "$GIT_WORK_AREA"

cd "$GIT_WORK_AREA"

git branch "$ITERATION"
git checkout "$ITERATION"

export CONTAINER_FOLDER="$GIT_WORK_AREA/containers"
export PIPELINE_FOLDER="$GIT_WORK_AREA/Pipline"
export MIGRATION_FOLDER="$GIT_WORK_AREA/Itration"

##
## Now to generate the SCRIPTS
##
$PRECISION100_FOLDER/create_migration_script.sh

git add --all
git commit -m "Added generated scripts for $MIGRATION - $ITERATION"

##
## Actually execute the created files
##
$MIGRATION_FOLDER/$MIGRATION_SCRIPT
