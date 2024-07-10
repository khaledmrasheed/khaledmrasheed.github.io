# @(#)Cshrc 1.1 86/07/09 SMI
#################################################################
#
#         .cshrc file
#
#         initial setups for both interactive and noninteractive
#         C-Shells
#
#################################################################

setenv LD_LIBRARY_PATH /opt/sfw/lib:/usr/lib:/usr/local/lib:/usr/openwin/lib:/usr/ucblib
setenv JSIM_HOME $HOME/JSIM
setenv MANPATH=/usr/man:/usr/local/man:/usr/lang/man:/usr/openwin/man
setenv PRINTER hp417
alias gs '/usr/local/gs5.50/bin/gs'

## set up search path

set path=( /bin /opt/sfw/bin /usr/local/bin /usr/ucb /sbin /bin /usr/sbin /usr/bin /usr/openwin/bin /usr/local/bin/X11 /usr/ccs/bin /etc /opt/SUNWspro/bin  /usr/local/Office51/bin /usr/ioffice6/bin /usr/ioffice6 ~/bin . ) 

#if ($TERM == emacs) stty -echo nl
## cd path
set lcd = ( )  #  add parents of frequently used directories
set cdpath = (.. ~ ~/bin ~/src $lcd)

## set this for all shells
set noclobber
biff y

## no group or other write permissions
umask 077

## limit size of core dumps
limit coredumpsize 0

## aliases for all shells
alias cd            'cd \!*;echo $cwd' 
alias cp            'cp -i'
alias mv            'mv -i'
## alias rm            'rm -i'
alias pwd           'echo $cwd'
alias del          'rm -i'
alias lsm 'ls -Flat|more'

## skip remaining setup if not an interactive shell
if ($?USER == 0 || $?prompt == 0) exit

## settings  for interactive shells
set history=40
set ignoreeof
set savehist=500
#set notify
set prompt="`whoami`\@`hostname`% "

## commands for interactive shells
#date
#pwd

## some aliases for using sccs
#alias create       sccs create
#alias delget       sccs delget
#alias delta        sccs delta
#alias edit         sccs edit
#alias get          sccs get
#alias unedit       sccs unedit
#alias unget        sccs unget

## other aliases
#alias a            alias
alias h            'history \!* | head -39 | more'
#alias u            unalias

#alias ^L           clear
#alias list         cat
alias m            more
alias mroe         more
#alias type         more

#alias .             'echo $cwd'
#alias ..            'set dot=$cwd;cd ..'
#alias ,             'cd $dot '

alias dir          ls
#alias pdw           'echo $cwd'
alias ff           'find . -name \!* -print'
#alias la            'ls -a'
#alias ll            'ls -la'
alias ls           'ls -FAs'

#alias pd           dirs
#alias po           popd
#alias pp           pushd

#alias open          'chmod go+r'
#alias shut          'chmod go-r'
#alias x             'chmod +x'

#alias j             'jobs -l'
#alias f             'fg %\!*'
#alias lo            logout

alias bye           logout
#alias ciao          logout
#alias die           logout

#alias k            kill
alias psg           'ps -ax | grep \!* | grep -v grep'
#alias punt          kill

#alias r            rlogin
#alias run          source
alias slay 'set j=`ps -ax|grep \!*|head -1`; kill -9 `echo $j[1]`'

#alias nms 'tbl \!* | nroff -ms | more'                  # nroff -ms
#alias tms 'tbl \!* | troff -t -ms >! troff.output &'    # troff -ms
#alias tpr 'tbl \!* | troff -t -ms | lpr -t &'           # troff & print
#alias ppr 'lpr -t \!* &'                                # print troffed

#alias c            'cc \!1.c \!:2* -o \!1 >>& c.errors'
#alias g            'g++ \!1 \!:2* -o \!1 >>& cc.errors'
#alias ccc          'cc \!*.c -o \!*'
#alias edit         textedit
setenv IOFFICE /usr/ioffice6
alias disp 'setenv DISPLAY 128.192.4.8:0.0'
alias hdisp 'setenv DISPLAY 128.192.101.28:0.0'
alias odisp 'setenv DISPLAY 128.192.4.131:0.0'

