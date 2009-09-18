%define		syntax	lighttpd
Summary:	Vim syntax: lighttpd
Name:		vim-syntax-%{syntax}
Version:	1.14
Release:	1
License:	Charityware
Group:		Applications/Editors/Vim
Source0:	lighttpd.vim
Source1:	ftdetect.vim
Source2:	syntax.sh
# for _vimdatadir existence
Requires:	vim-rt >= 4:6.3.058-3
BuildArch:	noarch
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%define		_vimdatadir	%{_datadir}/vim/vimfiles

%description
This plugin provides syntax highlighting for lighttpd config files.

%prep
%setup -qcT
cp -a %{SOURCE2} .

%build
rev=$(awk '/^".*Revision:/{print $5}' %{SOURCE0})
if [ "$rev" != "%{version}" ]; then
	: Update version $rev, and retry
	exit 1
fi

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT%{_vimdatadir}/{syntax,ftdetect}
cp -a %{SOURCE0} $RPM_BUILD_ROOT%{_vimdatadir}/syntax/%{syntax}.vim
cp -a %{SOURCE1} $RPM_BUILD_ROOT%{_vimdatadir}/ftdetect/%{syntax}.vim

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%doc syntax.sh
%{_vimdatadir}/syntax/%{syntax}.vim
%{_vimdatadir}/ftdetect/%{syntax}.vim
