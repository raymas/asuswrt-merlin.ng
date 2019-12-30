#!/bin/sh

# Asuswrt-Merlin helper functions
# For use with Postconf scripts (and others)

_quote() {
	printf "%s\n" "$1" | sed 's/[]\/$*.^&[]/\\&/g'
}

# This function looks for a string, and inserts a specified string after it inside a given file
# $1: the line to locate, $2: the line to insert, $3: Config file where to insert
pc_insert() {
	PATTERN=$(_quote "$1")
	CONTENT=$(_quote "$2")
	sed -i "/$PATTERN/a$CONTENT" $3
}

# This function looks for a string, and replace it with a different string inside a given file
# $1: the line to locate, $2: the line to replace with, $3: Config file where to insert
pc_replace() {
	PATTERN=$(_quote "$1")
	CONTENT=$(_quote "$2")
	sed -i "s/$PATTERN/$CONTENT/" $3
}

# This function will append a given string at the end of a given file
# $1 The line to append at the end, $2: Config file where to append
pc_append() {
	echo "$1" >> $2
}

# This function will delete a line containing a given string inside a given file
# $1 The line to locate, $2: Config file where to delete
pc_delete() {
	PATTERN=$(_quote "$1")
	sed -i "/$PATTERN/d" $2
}

# This function will return the first available custom webui page, allowing you
# to use it within your script.  "none" is returned if all 5 pages are already
# in use.

get_webui_page() {
	for i in 1 2 3 4 5
	do
		page=/www/ext/user$i.asp
		if [ ! -f $page ]
		then
			echo user$i.asp
			return
		fi
	done
	echo "none"
}

