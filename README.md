vim lighttpd syntax
===================

This vim bundle adds syntax highlighting for [lighttpd](http://www.lighttpd.net/) configuration files.

always recent version can be grabbed from:
https://github.com/glensc/vim-syntax-lighttpd/
 
## Installing and Using ##

- Install and configure [pathogen](https://github.com/tpope/vim-pathogen)

- Make a clone of the `vim-syntax-lighttpd` repository:
```
$ mkdir -p ~/.vim/bundle
$ cd ~/.vim/bundle
$ git clone https://github.com/glensc/vim-syntax-lighttpd.git
```

- OR use git submodules:
```
$ git submodule add https://github.com/glensc/vim-syntax-lighttpd.git bundle/vim-syntax-lighttpd
$ git submodule init
```

That's it. Pathogen should handle the rest. Opening a file that matches `/etc/lighttpd/**.conf`,`/usr/local/etc/lighttpd/**.conf` or `lighttpd*.conf` will load everything.

## Credits ##

 - Author [Elan Ruusamäe](https://github.com/glensc)
 - README.md derived from [vim-less](https://github.com/groenewege/vim-less) by [Jase Thew](https://github.com/jaset)

## License ##

Same as Vim License: http://www.vim.org/about.php
