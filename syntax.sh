#!/bin/sh
# Script to extract directives from lighttpd source
# Language:     lighttpd config, https://www.lighttpd.net/
# Maintainer:   Elan Ruusamae <glen@pld-linux.org>

d=$1/src
stubs=stubs

if [ $# = 0 -o ! -d "$d" ]; then
	echo >&2 "${0#*/}: <lighttpd-src>"
	exit 1
fi

create_stub() {
	local stub="$stubs/$1"

	test -f "$stub" && return 0
	install -d "${stub%/*}"
	touch "$stub"
}

create_stubs() {
	# create, as missing
	create_stub 'mysql.h'
	create_stub 'lua.h'
	create_stub 'lualib.h'
	create_stub 'lauxlib.h'
	# create to avoid warnings
	create_stub 'gssapi.h'
	create_stub 'gssapi/gssapi_krb5.h'
}

set -eu
create_stubs
for a in $d/configfile.c $d/mod_*.c; do
	[[ "$a" = */mod_skeleton.c ]] && continue
	echo >&2 "# $a"
	# replace NULL with 0, so that the definitions do not go multiline
	sed -e 's/NULL/0/g' "$a" | cpp -DHAVE_CRYPT_H -DHAVE_LSTAT -E -I "$stubs" -I "$d" | sed -n '
	/T_CONFIG_DEPRECATED/d

	# skip fastcgi.server
	/da_ext->value->used;/,$d

	/T_CONFIG_SCOPE_CONNECTION\|T_CONFIG_SCOPE_SERVER/{
		/"\([^"]\+\)"/s/.*"\([^"]\+\)".*/\t\\ \1/p
	}
	'
done | sort -u | grep -v not-working
