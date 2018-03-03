#!/usr/bin/env bash

declare programs=(
	'cygrunsrv'
	'openssh'
	'git'
	'vim'
	'ncurses'
	'curl'
	'wget'
	'rsync'
	'lynx'
	'nmap'
	'unzip'
	'tree'
	'realpath'
	'git'
)

install_programs() {
	choco install ${#programs[*]} -y source=cygwin
}

install_programs
