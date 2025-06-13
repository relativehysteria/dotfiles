# Firejail profile for Newsboat
# Description: RSS program
# This file is overwritten after every install/update
# Persistent local customizations
quiet
include newsboat.local
# Persistent global definitions
include globals.local

noblacklist ${HOME}/.config/newsboat
noblacklist ${HOME}/.local/share/newsboat

include disable-common.inc
include disable-devel.inc
include disable-exec.inc
include disable-interpreters.inc
include disable-programs.inc
include disable-xdg.inc

mkdir ${HOME}/.config/newsboat
mkdir ${HOME}/.local/share/newsboat
whitelist ${HOME}/.config/newsboat
whitelist ${HOME}/.local/share/newsboat
include whitelist-common.inc
include whitelist-var-common.inc

caps.drop all
ipc-namespace
netfilter
no3d
nodbus
nodvd
nogroups
nonewprivs
noroot
notv
nou2f
novideo
protocol inet,inet6,unix
seccomp

disable-mnt
private-cache
private-dev
private-etc alternatives,ca-certificates,crypto-policies,pki,resolv.conf,ssl,terminfo,ld.so.cache
private-tmp

memory-deny-write-execute
