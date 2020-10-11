Htpdate
-------

The HTTP Time Protocol (HTP) is used to synchronize a computer's time
with web servers as reference time source. Htpdate will synchronize your
computer's time by extracting timestamps from HTTP headers found
in web server responses. Htpdate can be used as a daemon, to keep your
computer synchronized.
The accuracy of htpdate is at least -+0.5 seconds (better with multiple
servers). If this is not good enough for you, try the ntpd package.

Install the htpdate package if you need tools for keeping your system's
time synchronized via the HTP protocol. Htpdate works also through
proxy servers.


Installation from source
------------------------

Tested on Linux and FreeBSD only, but should work for most Unix flavors.

	$ tar zxvf htpdate-x.y.z.tar.gz
		or
	$ tar jxvf htpdate-x.y.z.tar.bz2
	$ cd htpdate-X.Y.Z
	$ make
	$ make install

An example init script (scripts/htpdate.init) for use in /etc/init.d/
is included, but not installed automatically. This scripts with run
htpdate as a daemon.
There is also a service file example for systemd (scripts/htpdate.service).

Another option is to use htpdate in a cronjob and start it periodically
from cron. For a daily time sync it would look something like this:
5 3 * * * /usr/bin/htpdate -s www.example.com


Usage
-----

Usage:

    htpdate [-046abdhlqstxD] [-i pid file] [-m minpoll] [-M maxpoll]
	[-p precision] [-P <proxyserver>[:port]] [-u user[:group]]
	<host[:port]> ...

	Eg. htpdate -q www.example.com
	Eg. htpdate -a -t https://www.example.com http://www.example.com

In general, if more web servers are specified, the accuracy will increase.

See manpage for more details.

New features
------------

Version v1.2.4 introduced https support.

Maintenance
-----------

This project is a fork based on htp from Eddy Vervest (http://www.vervest.org/htp).
This fork exists only because original project is unmaintained and there are no other
active forks.
