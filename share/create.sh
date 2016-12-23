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
	local profilefile=$1

	if [[ ! -f ${profilefile} ]]; then
		echo "source profile.default" > ${profilefile}
	fi
}
