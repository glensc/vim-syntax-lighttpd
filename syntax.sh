#!/bin/sh
# Script to extract directives from lighttpd source
# Language:     lighttpd config, http://www.lighttpd.net/
# Maintainer:   Elan Ruusamae <glen@pld-linux.org>

d=$1/src

if [ $# = 0 -o ! -d "$d" ]; then
	echo >&2 "${0#*/}: <lighttpd-src>"
	exit 1
fi

set -e
for a in $d/configfile.c $d/mod_*.c; do
	[[ "$a" = */mod_skeleton.c ]] && continue
	echo >&2 "# $a"
	cpp -DHAVE_LSTAT -E $a 2>/dev/null | sed -n '
	/T_CONFIG_DEPRECATED/d

	# skip fastcgi.server
	/da_ext->value->used;/,$d

	/T_CONFIG_SCOPE_CONNECTION\|T_CONFIG_SCOPE_SERVER/{
		/"\([^"]\+\)"/s/.*"\([^"]\+\)".*/\t\\ \1/p
	}
	'
done | sort -u | grep -v not-working
