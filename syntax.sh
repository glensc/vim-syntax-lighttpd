#!/bin/sh
# Script to extract dirtectives from lighttpd source
# Language:     lighttpd config, http://www.lighttpd.net/
# Version Info: $Revision$
# Maintainer:   Elan Ruusamae <glen@pld-linux.org>
# Last Change:  $Date$ UTC

set -e
for a in configfile.c mod_*.c; do
	[ "$a" = "mod_skeleton.c" ] && continue
#	echo "# $a"
	cpp -DHAVE_LSTAT -E $a 2>/dev/null | sed -n '/static.*\(config_insert\|set_defaults\|log_access_open\)(/,/^}/{/config_values_t cv/,/};/{/T_CONFIG_DEPRECATED/d;/"\([^"]\+\)"/s/.*"\([^"]\+\)".*/\t\\ \1/p}}'
done | sort -u | grep -v not-working
