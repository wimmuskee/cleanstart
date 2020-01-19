# cleanstart
Tool to setup Gentoo test chroot environments.

## setup
The *cleanstart.conf* file contains the main files and directories for chroot locations, and stage files. It should point to existing files and directories.

## creating a chroot
Basically run the create command with a profile name that does not exist yet. The set stage file will be unpacked, and other information set.
```cleanstart-create -p mychroot```

### entering a chroot
The new chroot can be entered using the same profile name.
```cleanstart-chroot -p mychroot```

Optionally, the profile file in */etc/cleanstart/profiles/mychroot* can be edited to suit your own needs.
