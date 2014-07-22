#!/bin/sh
echo ""
echo "rsync backup LR-Master-SSD ready"
# echo "tail log or just wait..."

ARGS="-avz -r --itemize-changes --exclude-from /Users/brownlee/bin/.rsyncExclude"
echo "trying rsync $ARGS"

# {

echo ""

# check for LR external drive
if mount | grep Volumes/LR-Master-SSD > /dev/null; then
  echo "Found LR-Master-SSD"
else
  echo "Could not find LR-Master-SSD.  Did you mount it?"
  exit 1
fi

# check for main backup drive
if mount | grep Volumes/WD-2TB-Backup > /dev/null; then
  echo "Found WD-2TB-Backup"
  echo "Starting rsync..."
  rsync $ARGS /Volumes/LR-Master-SSD/images/ /Volumes/WD-2TB-Backup/LR-Backup/
else
  echo "Could not find WD-2TB-Backup.  Did you mount it?"
fi

# check for secondary external drive
if mount | grep Volumes/WD-2TB-Ext > /dev/null; then
  echo "Found WD-2TB-Ext"
  echo "Starting rsync..."
  rsync $ARGS /Volumes/LR-Master-SSD/images/ /Volumes/WD-2TB-Ext/LR-Secondary-Backup/
else
  echo "Could not find WD-2TB-Ext.  Did you mount it?"
fi

echo ""
echo "... syncLRMasterToBackup.sh done"
echo ""
echo "================================================"

# } > ~/.scriptLogs/backup-lightroom-Master-SSD-$(date +%F).log

#echo "dumping log output:"
#echo ""
# cat ~/.scriptLogs/backup-lightroom-Master-SSD-$(date +%F).log
