BEGIN {
	print "# CHANGELOG"

	COMMIT = ""
	OTHER_COMMIT_FIRST=1
	DATE = ""
	TAG = ""
	"git config --get remote.origin.url" | getline ORIGIN
}
/^commit/ {
	COMMIT=$2
	if($0 !~ /tag:/) {
		TAG = ""
		next
	}
	TAG=gensub(/.+tag\: (.+)\)$/, "\\1", "g", $0)
	OTHER_COMMIT_FIRST=1
}
/^Date:/ {
	DATE = substr($0, 9)
	if(TAG != "") {
		print ""
		print "## " TAG " (" DATE ") [" substr(COMMIT, 0, 7) "](" ORIGIN "/commit/" COMMIT ")"
		print ""
		COMMIT = ""
	}
}
/^    / {
	if(TAG != "") {
		sub(/^ +/, "") ; print
	} else {
		if(OTHER_COMMIT_FIRST) {
			print ""
			print "- other commits"
			OTHER_COMMIT_FIRST=0
		}
		sub(/^ +-?/, "")
		print "    - " $0 " (" DATE ") [" substr(COMMIT, 0, 7) "](" ORIGIN "/commit/" COMMIT ")"
	}
}
