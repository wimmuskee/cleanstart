# This file is part of the cleanstart package.

VERSION="0.1"
CONFIGFILE="/etc/cleanstart/cleanstart.conf"


function die {
	echo "Error: $@" >&2
	exit 1
}

function usage {
	echo "none yet, just read the code"
}

function sourceConfig {
	local configfile=$1

	[[ -z ${configfile} ]] && die "no configfile specified"
	source ${CONFIGFILE}
}

function validateProfile {
	local profile=$1

	[[ -z ${profile} ]] && die "no profile specified"
	profile_filter_valid=$(echo ${profile} | sed 's/[0-9A-Za-z]//g')
	[[ "${#profile_filter_valid}" -ne 0 ]] && die "profile should contain only alphanumeric characters: ${profile}"
}
