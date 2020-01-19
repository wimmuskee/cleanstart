# This file is part of the cleanstart package.

VERSION="0.4"
CONFIGFILE="/etc/cleanstart/cleanstart.conf"
PROFILEDIR="/etc/cleanstart/profiles"

function die {
	echo "Error: $@" >&2
	exit 1
}

function warn {
	echo "Warning: $1"
}

function usage {
cat <<EOF
Usage: $0 [OPTION]

Options:
  -c, --config[=path]           Set application config. By default, then
                                one in /etc/cleanstart/cleanstart.conf is used.
  -h, --help                    Displays this help message.
  -p, --profile[=id]            Uses the set profile.
  -v, --version                 Displays the shell-oaiharvester version.
EOF
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

function sourceProfile {
	local profile=$1

	if [[ -f ${PROFILEDIR}/${profile} ]]; then
		source ${PROFILEDIR}/${profile}
	else
		warn "provided profile does not have a config, running default chroot"
	fi
}

function checkBindmountDir {
	local dir=$1
	
	if [[ "${dir}" == "" ]] || [[ "${dir}" == "/" ]]; then
		return 1
	else
		return 0
	fi
}
