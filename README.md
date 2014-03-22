vim lighttpd syntax
===================

syntax highlighting for lighttpd config files. 

lighttpd (lighty) is lightweight open-source web server: http://www.lighttpd.net/ 

always recent version can be grabbed from:
https://github.com/glensc/vim-syntax-lighttpd/
 

install details
===============


- for local install:`PREFIX=~/.vim` 
- for global install (requries root privileges): `PREFIX=/usr/share/vim/vimfiles`


and then run: 
```
mkdir -p $PREFIX/{syntax,ftdetect} 
cp syntax/lighttpd.vim $PREFIX/syntax/lighttpd.vim 
cp ftdetect/lighttpd.vim $PREFIX/ftdetect/lighttpd.vim 
```
