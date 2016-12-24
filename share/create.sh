# This file is part of the cleanstart package.

function setMisc {
	local basedir=$1
	cp -L /etc/resolv.conf ${basedir}/etc/
	mkdir -p ${basedir}/usr/portage
}

function setBashrc {
	local basedir=$1
	echo "PS1='\[\033]0;\u@\h:\w\007\]\[\033[01;31m\]\h\[\033[01;34m\] \W \$ \[\033[01;33m\][chroot] \[\033[00m\]'" >> ${basedir}/root/.bashrc
}

# create new profile config file if not exists
function setProfileFile {
	local profiledir=$1
	local profile=$2

	if [[ ! -f ${profilefile} ]]; then
		echo "source ${profiledir}/profile.default" > ${profiledir}/${profile}
	fi
}

# create cleanstart version stamp in chroot
function setStamp {
	local basedir=$1
	local version=$2
	echo "cleanstart-${version}" > ${basedir}/cleanstart
	echo $(date -Iseconds) >> ${basedir}/cleanstart
}
