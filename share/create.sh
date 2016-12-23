# This file is part of the cleanstart package.

# create new profile config file if not exists
function createProfileFile {
	local profilefile=$1

	if [[ ! -f ${profilefile} ]]; then
		echo "source profile.default" > ${profilefile}
	fi
}
