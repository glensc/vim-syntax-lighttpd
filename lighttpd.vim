" Vim syntax file
" Language:		lighttpd lighttpd
" Maintainer:	Elan Ruusamae <glen@delfi.ee>
" Last Change:	$Date$ UTC

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

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
syn match    lighttpdOption   /accesslog\.\(filename\|format\)/
syn match    lighttpdOption   /alias\.url/
syn match    lighttpdOption   /auth\.\(debug\|backend\|require\)/
syn match    lighttpdOption   /auth\.backend\.\(plain\|htpasswd\|htdigest\)\.userfile/
syn match    lighttpdOption   /auth\.backend\.ldap\.\(hostname\|base-dn\|filter\)/
syn match    lighttpdOption   /auth\.backend\.plain\.groupfile/
syn match    lighttpdOption   /debug\.log-\(file-not-found\|\(request\|response\)-header\|\(request\|condition\)-handling\)/
syn match    lighttpdOption   /dir-listing\.encoding/
syn match    lighttpdOption   /etag\.use-\(inode\|mtime\|size\)/
syn match    lighttpdOption   /expire\.url/
syn match    lighttpdOption   /extforward\.forwarder/
syn match    lighttpdOption   /fastcgi\.\(server\|debug\|map-extensions\)/
syn match    lighttpdOption   /mimetype\.\(assign\|use-xattr\)/
syn match    lighttpdOption   /rrdtool\.\(binary\|db-name\)/
syn match    lighttpdOption   /server\.\(error-handler-404\|kbytes-per-second\|bind\|tag\|errorlog\|chroot\|dir-listing\)/
syn match    lighttpdOption   /server\.\(modules\|indexfiles\|document-root\|errorlog-use-syslog\|pid-file\|range-requests\)/
syn match    lighttpdOption   /server\.\(name\|event-handler\|max-write-idle\|port\|username\|groupname\|errorfile-prefix\)/
syn match    lighttpdOption   /static-file\.\(exclude-extensions\|etags\)/
syn match    lighttpdOption   /status\.\(status-url\|config-url\|statistics-url\)/
syn match    lighttpdOption   /url\.\(access-deny\|redirect\|rewrite-once\|rewrite\)/
syn match    lighttpdOption   /var\.[A-Za-z][A-Za-z0-9]*/

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
