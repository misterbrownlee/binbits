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
# +++++++++ - this is a newly created item

# TMI: 'Y X c s t p o g z'
#   'Y' is replaced by the type of update being done
#   Update types that replace the Y are as follows:
#     '<' sent aka transferred to the remote host
#     '>' recieved aka transferred to the local host
#     'c' local change/creation is occurring for the item such as the creation of a directory or the changing of a symlink, etc.
#     'h' hard link to another item (requires --hard-links).
#     '.' not being updated (though it might have attributes that are being modified).

#   'X' is replaced by the file type
#   File types:
#     'f' for file
#     'd' for a directory
#     'L' for symlink
#     'D' for device
#     'S' for special

# The attribute that is associated with each letter is as follows:
#  'c': checksum of the file is different and will be updated by the file transfer (requires --checksum).
#  's': size of the file is different and will be updated by the file transfer.
#  't': time of modification is different and is being updated to the sender's value (requires  --times).  An alternate value of T means that the time will be set to the transfer time, which happens anytime a symlink is transferred, or  when  a  file  or  device  is transferred without --times.
#  'p': permissions are different and are being updated to the sender's value (requires --perms)
#  'o': owner is different and is being updated to the sender's value (requires --owner and super-user privileges).
#  'g': group is different and is being updated to the sender's value (requires --group and the authority to set the group).

#  The 'z' slot is reserved for future use.

LR_MASTER="/Volumes/LR-Master-SSD"
# LR_BACKUP="/Volumes/WD-2TB-Backup"

LR_BACKUP_REPEAT="/Volumes/WD-2TB-Backup"
FROM_PATH="$LR_MASTER/images/"
TO_PATH="$LR_BACKUP/LR-Backup/"

ARGS="-avz -r --delete --delete-excluded --itemize-changes --exclude-from ~/.rsyncExclude"

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
