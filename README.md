https://jenkins.dzavy.net/job/YunaPBX_Build_x86/lastSuccessfulBuild/artifact/bin/targets/x86/generic-glibc/openwrt-x86-generic-combined-ext4.img.gz

# Additional packages
- asterisk13-codec-opus
- asterisk13-codec-silk
- asterisk15-codec-opus
- asterisk15-codec-silk
- certmonger
- libnspr
- libnss
- libphonenumber
- libtevent
- mariadb-connector-odbc
- sscep
- statsite
- vorbis-tools

# Changed packages
- e2fsprogs - fixed build (added -lpthread)
- iksemel - compile with OpenSSL instead of GNUTLS
- php7 - fixed build with GCC7 ($(FPIC))
- ubox - changes to logread (file permissions and timestamp format)
- zabbix - added TLS support

# 3rd party packages
- luadbi
