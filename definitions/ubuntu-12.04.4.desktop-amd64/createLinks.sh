#! /bin/sh

#######################################################
# createLinksForAllFilesInDirectory
#
# Create symlinks to all files in a given directory
#
# Parameter 1: The directory where the files reside
#######################################################
function createLinksForAllFilesInDirectory() {
	directory=$1
	files=$(find $directory -type f)
	for f in $files
	do
		basename=$(basename $f)
		echo "Creating link $1/$basename to $basename"
		rm -f $basename
	    ln -s $1/$basename $basename
	done
}

createLinksForAllFilesInDirectory ../ubuntu-12.04.4.desktop-i386
