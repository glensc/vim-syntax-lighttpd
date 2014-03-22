" Vim filetype detect file
" Language:     lighttpd config, http://www.lighttpd.net/
" URL:          https://github.com/glensc/vim-syntax-lighttpd
" Version Info: 1.18
" Maintainer:   Elan Ruusamäe <glen@pld-linux.org>
au BufNewFile,BufRead /etc/lighttpd/*.conf,lighttpd*.conf set filetype=lighttpd
