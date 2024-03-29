# Firejail profile for zathura
# Description: Document viewer with a minimalistic interface
# This file is overwritten after every install/update
# Persistent local customizations
include zathura.local
# Persistent global definitions
include globals.local

noblacklist ${HOME}/.config/zathura
noblacklist ${HOME}/.local/share/zathura
noblacklist ${DOCUMENTS}

include disable-common.inc
include disable-devel.inc
include disable-exec.inc
include disable-interpreters.inc
include disable-programs.inc
include disable-xdg.inc

caps.drop all
machine-id
net none
nodbus
nodvd
nogroups
nonewprivs
noroot
nosound
notv
nou2f
novideo
protocol unix
seccomp
shell none
tracelog

private-bin zathura
private-cache
private-dev
private-etc alternatives,fonts,machine-id,ld.so.cache

mkdir ${HOME}/.config/zathura
mkdir ${HOME}/.local/share/zathura
read-only ${HOME}
read-write ${HOME}/.config/zathura
read-write ${HOME}/.local/share/zathura
