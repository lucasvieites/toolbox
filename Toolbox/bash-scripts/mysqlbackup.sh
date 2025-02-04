#!/bin/bash
# mysqlbackup.sh
# Back up all databases of a server putting each db in a different file
#
# By Lucas Vieites
# http://www.codexion.com/
# Changelog
# v. 20170201
# * Added $USER and $PASS as variables
# v. 20091222
# * Initial creation of the script

# Backup destination directory
BACKUP_DIR="$HOME/backup/"
# Name of the backup file
BACKUP_FILENAME="mysqlbackup"
# Use the date for the filenames
BACKUP_DATE=`date +"%Y%m%d_%H%M%S"`
# Name of the archive file
BACKUP_ARCHIVE=${BACKUP_DIR}${BACKUP_FILENAME}_${BACKUP_DATE}.tgz
# Credentials
USER=root
PASS=mysqlpassword
TEMP_DIR="/tmp/"

# Check if the temporary directory exists, if not, create it
if [ -d ${TEMP_DIR}${BACKUP_FILENAME}/ ]; then
	# directory exists
	echo "Cleaning ${TEMP_DIR} ..."
	rm -rf ${TEMP_DIR}${BACKUP_FILENAME}/*
else
	echo "Creating ${TEMP_DIR} ..."
	mkdir ${TEMP_DIR}${BACKUP_FILENAME}/
fi

# Get all database names
DATABASES=`mysqlshow -u ${USER} -p${PASS} | sed 's/[ +-|]\+//g' | sed '/\-/d' | sed 's/^Databases//g' | sed '/^$/d'`

# Dump each db in a different file in the temp dir
for db in $DATABASES; do
	echo item: $db
	mysqldump -v -u ${USER} -p${PASS} -h localhost --create-options --extended-insert --databases $db > ${TEMP_DIR}${BACKUP_FILENAME}/${BACKUP_DATE}_${db}.sql
done

# Create the archive file in the backup dir
pushd ${TEMP_DIR}
tar cfz ${BACKUP_ARCHIVE} ${BACKUP_FILENAME}/${BACKUP_DATE}_*
popd

# Remove temp files
echo "Cleaning ${TEMP_DIR} ..."
rm -rf ${TEMP_DIR}${BACKUP_FILENAME}/*

# Pretty output
echo "###############################################################################"
echo "   Archive file: ${BACKUP_ARCHIVE}"
echo "   Archive size: "`stat -c%s ${BACKUP_ARCHIVE}`" bytes"
echo "###############################################################################"
echo "End"
echo ""
