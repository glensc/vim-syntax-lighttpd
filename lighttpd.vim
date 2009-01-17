" Vim syntax file
" Language:     lighttpd config, http://www.lighttpd.net/
" Version Info: $Revision$
" Maintainer:   Elan Ruusamae <glen@pld-linux.org>
" Last Change:  $Date$ UTC

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

if version < 600
	set iskeyword+=.,-
else
	setlocal iskeyword+=.,-
endif

" define the lighttpd syntax
syn match   lighttpdDelimiter   "[()\[\];,]"
syn match   lighttpdOperator    "[=|&\*\+\<\>]"
syn match   lighttpdComment     "\(#.*\)"
syn match   lighttpdNumber      "[-+]\=\<\d\+\(\.\d*\)\=\>"
syn region  lighttpdString      start=+"+ skip=+\\"+ end=+"+
syn keyword lighttpdConditional else
syn match   lighttpdServerVar   /\$\(HTTP\|SERVER\)\>/

" internal keywords
syn keyword lighttpdKeyword   include include_shell

syn match   lighttpdSpecial   /"\(dis\|en\)able"/

" module options
syn match   lighttpdOption   /var\.[A-Za-z][A-Za-z0-9]*/
syn keyword lighttpdOption
	\ accesslog.filename
	\ accesslog.format
	\ alias.url
	\ auth.backend
	\ auth.backend.htdigest
	\ auth.backend.htpasswd
	\ auth.backend.ldap.base-dn
	\ auth.backend.ldap.filter
	\ auth.backend.ldap.hostname
	\ auth.backend.plain
	\ auth.backend.plain.groupfile
	\ auth.debug
	\ auth.require
	\ debug.log-condition-handling
	\ debug.log-file-not-found
	\ debug.log-request-handling
	\ debug.log-request-header
	\ debug.log-response-header
	\ dir-listing.encoding
	\ etag.use-inode
	\ etag.use-mtime
	\ etag.use-size
	\ expire.url
	\ extforward.forwarder
	\ fastcgi.debug
	\ fastcgi.map-extensions
	\ fastcgi.server
	\ mimetype.assign
	\ mimetype.use-xattr
	\ rrdtool.binary
	\ rrdtool.db-name
	\ server.bind
	\ server.chroot
	\ server.dir-listing
	\ server.document-root
	\ server.errorfile-prefix
	\ server.error-handler-404
	\ server.errorlog
	\ server.errorlog-use-syslog
	\ server.event-handler
	\ server.groupname
	\ server.indexfiles
	\ server.kbytes-per-second
	\ server.max-fds
	\ server.max-keep-alive-idle
	\ server.max-keep-alive-requests
	\ server.max-read-idle
	\ server.max-write-idle
	\ server.modules
	\ server.name
	\ server.pid-file
	\ server.port
	\ server.range-requests
	\ server.tag
	\ server.username
	\ static-file.etags
	\ static-file.exclude-extensions
	\ status.config-url
	\ status.statistics-url
	\ status.status-url
	\ url.access-deny
	\ url.redirect
	\ url.rewrite
	\ url.rewrite-once

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_lighttpd_syntax_inits")
  if version < 508
    let did_lighttpd_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink lighttpdDelimiter   Delimiter
  HiLink lighttpdOperator    Operator
  HiLink lighttpdComment     Comment
  HiLink lighttpdNumber      Number
  HiLink lighttpdKeyword     Keyword
  HiLink lighttpdOption      Function
  HiLink lighttpdSpecial     Special
  HiLink lighttpdConditional Conditional
  HiLink lighttpdString      String
  HiLink lighttpdServerVar   Identifier

  delcommand HiLink
endif

let b:current_syntax = "lighttpd"

" vim: ts=4
