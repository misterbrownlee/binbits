#!/bin/sh

# USAGE:
#
# You should be able to just type 'syncMasterToBackup'.  Of course, all the
# names of the paths need to be still right.  But I think it will work.

echo "\nThis will backup the paths given if you just keep your pants on"
# echo "tail log or just wait..."
# dry run is useful: -n

# rsync options used are
# -a sets archive mode... which is this:
#    -r recurse into directories
#    -l copy symlinks as symlinks
#    -p preserve permissions
#    -t preserve modification times
#    -g preserve group
#    -o preserve owner (super-user only)
#    -D same as --devices --specials
#       --devices preserve device files (super-user only)
#       --specials preserve special files

# -v sets verbose
# -z sets compress (during transfer)

# Output:
# > - the item is received
# f - it is a regular file
# d - a directory
# s - the file size is different
# t - the time stamp is different
# p - permissions updated to match sender
# +++++++++ - this is a newly created item

LR_MASTER="/Volumes/LR-Master-SSD"
LR_BACKUP="/Volumes/WD-2TB-Backup"
LR_BACKUP_REPEAT="/Volumes/WD-2TB-Backup"
FROM_PATH="$LR_MASTER/images/"
TO_PATH="$LR_BACKUP/LR-Backup/"

ARGS="-avz -r --delete --delete-excluded --itemize-changes --exclude-from /Users/brownlee/bin/bits/.rsyncExclude"

# {


# check for LR external drive
if mount | grep "on $LR_MASTER" > /dev/null; then
  echo "Found $LR_MASTER"
  echo "From will be $FROM_PATH\n"
else
  echo "Could not find $LR_MASTER.  Did you mount it?"
  exit 1
fi

# check for main backup drive
if mount | grep "on $LR_BACKUP" > /dev/null; then
  echo "Found $LR_BACKUP"
  echo "To will be $TO_PATH"
else
  echo "Could not find WD-2TB-Backup.  Did you mount it?"
  exit 1
fi

echo "\nStarting ...\n"
echo "Trying: rsync $ARGS $FROM_PATH $TO_PATH\n"

rsync $ARGS "$FROM_PATH" "$TO_PATH"

# check for secondary external drive
# if mount | grep Volumes/WD-2TB-Ext > /dev/null; then
#   echo "Found WD-2TB-Ext"
#   echo "Starting rsync..."
#   rsync $ARGS /Volumes/LR-Master-SSD/images/ /Volumes/WD-2TB-Ext/LR-Secondary-Backup/
# else
#   echo "Could not find WD-2TB-Ext.  Did you mount it?"
# fi

echo ""
echo "... syncLRMasterToBackup.sh done"
echo ""
# echo "================================================"

# } > ~/.scriptLogs/backup-lightroom-Master-SSD-$(date +%F).log

#echo "dumping log output:"
#echo ""
# cat ~/.scriptLogs/backup-lightroom-Master-SSD-$(date +%F).log
