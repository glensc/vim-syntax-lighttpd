" Vim syntax file
" Language:     lighttpd config, http://www.lighttpd.net/
" URL:          https://github.com/glensc/vim-syntax-lighttpd
" Version Info: 1.19
" Maintainer:   Elan Ruusamäe <glen@pld-linux.org>

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
" see also http://redmine.lighttpd.net/wiki/lighttpd/Docs:Configuration
syn match   lighttpdDelimiter   "[{}()\[\];,]"
syn match   lighttpdOperator    "[~!=|&\*\+\<\>]"
syn match   lighttpdComment     "\(#.*\)"
syn match   lighttpdNumber      "[-+]\=\<\d\+\(\.\d*\)\=\>"
syn region  lighttpdString      start=+"+ skip=+\\"+ end=+"+
syn keyword lighttpdConditional else
syn match   lighttpdServerVar   /\$\(HTTP\|SERVER\|PHYSICAL\)\>/
syn match   lighttpdFunction    /"\(cookie\|host\|useragent\|referer\|url\|querystring\|remoteip\|scheme\|socket\|path\|existing-path\)"/

" internal keywords
syn keyword lighttpdKeyword   include include_shell

syn match   lighttpdSpecial   /"\(dis\|en\)able"/

" module options
syn match   lighttpdOption   /var\.[A-Za-z][_A-Za-z0-9]*/
syn match   lighttpdOption   /env\.[A-Za-z][_A-Za-z0-9]*/
syn keyword lighttpdOption
	\ accesslog.filename
	\ accesslog.format
	\ accesslog.syslog-level
	\ accesslog.use-syslog
	\ alias.url
	\ auth.backend
	\ auth.backend.gssapi.keytab
	\ auth.backend.gssapi.principal
	\ auth.backend.gssapi.store-creds
	\ auth.backend.htdigest.userfile
	\ auth.backend.htpasswd.userfile
	\ auth.backend.ldap.allow-empty-pw
	\ auth.backend.ldap.base-dn
	\ auth.backend.ldap.bind-dn
	\ auth.backend.ldap.bind-pw
	\ auth.backend.ldap.ca-file
	\ auth.backend.ldap.filter
	\ auth.backend.ldap.groupmember
	\ auth.backend.ldap.hostname
	\ auth.backend.ldap.starttls
	\ auth.backend.mysql.col_pass
	\ auth.backend.mysql.col_realm
	\ auth.backend.mysql.col_user
	\ auth.backend.mysql.db
	\ auth.backend.mysql.host
	\ auth.backend.mysql.pass
	\ auth.backend.mysql.port
	\ auth.backend.mysql.socket
	\ auth.backend.mysql.user
	\ auth.backend.mysql.users_table
	\ auth.backend.pam.opts
	\ auth.backend.plain.groupfile
	\ auth.backend.plain.userfile
	\ auth.backend.sasl.opts
	\ auth.extern-authn
	\ auth.require
	\ cgi.assign
	\ cgi.execute-x-only
	\ cgi.local-redir
	\ cgi.upgrade
	\ cgi.x-sendfile
	\ cgi.x-sendfile-docroot
	\ cml.extension
	\ cml.memcache-hosts
	\ cml.memcache-namespace
	\ cml.power-magnet
	\ compress.allowed-encodings
	\ compress.cache-dir
	\ compress.filetype
	\ compress.max-filesize
	\ compress.max-loadavg
	\ connection.kbytes-per-second
	\ debug.log-condition-handling
	\ debug.log-file-not-found
	\ debug.log-request-handling
	\ debug.log-request-header
	\ debug.log-request-header-on-error
	\ debug.log-response-header
	\ debug.log-ssl-noise
	\ debug.log-state-handling
	\ debug.log-timeouts
	\ deflate.allowed-encodings
	\ deflate.compression-level
	\ deflate.max-compress-size
	\ deflate.max-loadavg
	\ deflate.mimetypes
	\ deflate.min-compress-size
	\ deflate.output-buffer-size
	\ deflate.work-block-size
	\ dir-listing.activate
	\ dir-listing.auto-layout
	\ dir-listing.encode-header
	\ dir-listing.encode-readme
	\ dir-listing.encoding
	\ dir-listing.exclude
	\ dir-listing.external-css
	\ dir-listing.external-js
	\ dir-listing.hide-dotfiles
	\ dir-listing.hide-header-file
	\ dir-listing.hide-readme-file
	\ dir-listing.set-footer
	\ dir-listing.show-header
	\ dir-listing.show-readme
	\ etag.use-inode
	\ etag.use-mtime
	\ etag.use-size
	\ evasive.location
	\ evasive.max-conns-per-ip
	\ evasive.silent
	\ evhost.path-pattern
	\ expire.mimetypes
	\ expire.url
	\ extforward.forwarder
	\ extforward.hap-PROXY
	\ extforward.hap-PROXY-ssl-client-verify
	\ extforward.headers
	\ extforward.params
	\ fastcgi.balance
	\ fastcgi.debug
	\ fastcgi.map-extensions
	\ fastcgi.server
	\ flv-streaming.extensions
	\ geoip.db-filename
	\ geoip.memory-cache
	\ index-file.names
	\ magnet.attract-physical-path-to
	\ magnet.attract-raw-url-to
	\ maxminddb.activate
	\ maxminddb.db
	\ maxminddb.env
	\ mimetype.assign
	\ mimetype.use-xattr
	\ mimetype.xattr-name
	\ mysql-vhost.db
	\ mysql-vhost.hostname
	\ mysql-vhost.pass
	\ mysql-vhost.port
	\ mysql-vhost.sock
	\ mysql-vhost.sql
	\ mysql-vhost.user
	\ proxy.balance
	\ proxy.debug
	\ proxy.forwarded
	\ proxy.header
	\ proxy.map-extensions
	\ proxy.replace-http-host
	\ proxy.server
	\ rrdtool.binary
	\ rrdtool.db-name
	\ scgi.balance
	\ scgi.debug
	\ scgi.map-extensions
	\ scgi.protocol
	\ scgi.server
	\ secdownload.algorithm
	\ secdownload.document-root
	\ secdownload.hash-querystr
	\ secdownload.path-segments
	\ secdownload.secret
	\ secdownload.timeout
	\ secdownload.uri-prefix
	\ server.bind
	\ server.breakagelog
	\ server.bsd-accept-filter
	\ server.chroot
	\ server.chunkqueue-chunk-sz
	\ server.compat-module-load
	\ server.core-files
	\ server.defer-accept
	\ server.dir-listing
	\ server.document-root
	\ server.errorfile-prefix
	\ server.error-handler
	\ server.error-handler-404
	\ server.error-intercept
	\ server.errorlog
	\ server.errorlog-use-syslog
	\ server.event-handler
	\ server.follow-symlink
	\ server.force-lowercase-filenames
	\ server.groupname
	\ server.http-parseopt-header-strict
	\ server.http-parseopt-host-normalize
	\ server.http-parseopt-host-strict
	\ server.http-parseopts
	\ server.indexfiles
	\ server.kbytes-per-second
	\ server.listen-backlog
	\ server.max-connections
	\ server.max-fds
	\ server.max-keep-alive-idle
	\ server.max-keep-alive-requests
	\ server.max-read-idle
	\ server.max-request-field-size
	\ server.max-request-size
	\ server.max-worker
	\ server.max-write-idle
	\ server.modules
	\ server.name
	\ server.network-backend
	\ server.pid-file
	\ server.port
	\ server.protocol-http11
	\ server.range-requests
	\ server.reject-expect-100-with-417
	\ server.set-v6only
	\ server.socket-perms
	\ server.stat-cache-engine
	\ server.stream-request-body
	\ server.stream-response-body
	\ server.syslog-facility
	\ server.systemd-socket-activation
	\ server.tag
	\ server.upload-dirs
	\ server.upload-temp-file-size
	\ server.use-ipv6
	\ server.username
	\ setenv.add-environment
	\ setenv.add-request-header
	\ setenv.add-response-header
	\ setenv.set-environment
	\ setenv.set-request-header
	\ setenv.set-response-header
	\ simple-vhost.debug
	\ simple-vhost.default-host
	\ simple-vhost.document-root
	\ simple-vhost.server-root
	\ sockproxy.balance
	\ sockproxy.debug
	\ sockproxy.server
	\ ssi.conditional-requests
	\ ssi.content-type
	\ ssi.exec
	\ ssi.extension
	\ ssi.recursion-max
	\ ssl.acme-tls-1
	\ ssl.ca-crl-file
	\ ssl.ca-dn-file
	\ ssl.ca-file
	\ ssl.cipher-list
	\ ssl.dh-file
	\ ssl.disable-client-renegotiation
	\ ssl.ec-curve
	\ ssl.empty-fragments
	\ ssl.engine
	\ ssl.honor-cipher-order
	\ ssl.openssl.ssl-conf-cmd
	\ ssl.pemfile
	\ ssl.privkey
	\ ssl.read-ahead
	\ ssl.use-sslv2
	\ ssl.use-sslv3
	\ ssl.verifyclient.activate
	\ ssl.verifyclient.depth
	\ ssl.verifyclient.enforce
	\ ssl.verifyclient.exportcert
	\ ssl.verifyclient.username
	\ static-file.disable-pathinfo
	\ static-file.etags
	\ static-file.exclude-extensions
	\ status.config-url
	\ status.enable-sort
	\ status.statistics-url
	\ status.status-url
	\ trigger-before-download.debug
	\ trigger-before-download.deny-url
	\ trigger-before-download.download-url
	\ trigger-before-download.gdbm-filename
	\ trigger-before-download.memcache-hosts
	\ trigger-before-download.memcache-namespace
	\ trigger-before-download.trigger-timeout
	\ trigger-before-download.trigger-url
	\ unused-slot-moved-to-mod-openssl
	\ upload-progress.progress-url
	\ url.access-allow
	\ url.access-deny
	\ url.redirect
	\ url.redirect-code
	\ url.rewrite
	\ url.rewrite-final
	\ url.rewrite-if-not-file
	\ url.rewrite-once
	\ url.rewrite-repeat
	\ url.rewrite-repeat-if-not-file
	\ userdir.active
	\ userdir.basepath
	\ userdir.exclude-user
	\ userdir.include-user
	\ userdir.letterhomes
	\ userdir.path
	\ usertrack.cookie-attrs
	\ usertrack.cookie-domain
	\ usertrack.cookie-max-age
	\ usertrack.cookie-name
	\ vhostdb.backend
	\ vhostdb.dbi
	\ vhostdb.ldap
	\ vhostdb.mysql
	\ vhostdb.pgsql
	\ webdav.activate
	\ webdav.is-readonly
	\ webdav.log-xml
	\ webdav.opts
	\ webdav.sqlite-db-name
	\ wstunnel.balance
	\ wstunnel.debug
	\ wstunnel.frame-type
	\ wstunnel.map-extensions
	\ wstunnel.origins
	\ wstunnel.ping-interval
	\ wstunnel.server

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
  HiLink lighttpdFunction    Function
  HiLink lighttpdKeyword     Keyword
  HiLink lighttpdOption      Identifier
  HiLink lighttpdSpecial     Special
  HiLink lighttpdConditional Conditional
  HiLink lighttpdString      String
  HiLink lighttpdServerVar   Identifier

  delcommand HiLink
endif

let b:current_syntax = "lighttpd"

" vim: ts=4
