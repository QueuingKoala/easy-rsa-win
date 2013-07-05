#!/bin/sh

export PS1='\nEasyRSA Shell\n$ '
EASYRSA_PATH="${EASYRSA:-$(pwd)}"
export PATH="$EASYRSA_PATH:$EASYRSA_PATH/bin:$PATH"
# This prevents needless warning messages from appearing:
export CYGWIN="nodosfilewarning"

if [ -z "$OPENSSL" ] && ! which openssl.exe >/dev/null 2>&1; then
	echo "WARNING: openssl isn't in your system PATH. The openssl binary must be"
	echo "  available in the PATH, or you may set the OPENSSL environment variable"
	echo "  or define it in the 'vars' file. See openssl-win32.txt for more info."
fi

[ -f "$EASYRSA_PATH/easyrsa" ] || {
	echo "Missing easyrsa script. Expected to find it at: $EASYRSA/easyrsa"
	exit 2
}

echo ""
echo "Welcome to the EasyRSA 3 Shell for Windows."
echo "Easy-RSA 3 is available under a GNU GPLv2 license."
echo ""
echo "Invoke './easyrsa' to call the program. Without commands, help is displayed."

bin/sh