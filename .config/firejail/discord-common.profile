# Firejail profile for discord
# This file is overwritten after every install/update
# Persistent local customizations
include discord-common.local
# Persistent global definitions
# added by caller profile
#include globals.local

ignore noexec ${HOME}

include disable-common.inc
include disable-devel.inc
include disable-exec.inc
include disable-programs.inc

whitelist ${DOWNLOADS}
whitelist ${HOME}/pictures/screens
whitelist ${HOME}/pictures/saved
whitelist ${HOME}/music
whitelist ${HOME}/videos/discord
include whitelist-common.inc
include whitelist-var-common.inc

caps.drop all
netfilter
nogroups
nonewprivs
noroot
protocol unix,inet,inet6,netlink
seccomp !chroot

private-bin bash,cut,echo,egrep,fish,grep,head,sed,sh,tclsh,tr,xdg-mime,xdg-open,zsh
private-dev
private-etc alternatives,ca-certificates,crypto-policies,fonts,group,ld.so.cache,localtime,login.defs,machine-id,password,pki,resolv.conf,ssl
private-tmp
