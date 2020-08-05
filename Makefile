prefix = $(DESTDIR)/usr
bindir = ${prefix}/bin
mandir = ${prefix}/share/man

CC ?= gcc
CFLAGS += -Wall -std=c99 -pedantic -O2

ifdef ENABLE_HTTPS
CFLAGS += -DENABLE_HTTPS
LDFLAGS += -lssl -lcrypto
endif

INSTALL = install -c

all: htpdate

htpdate: htpdate.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -o htpdate htpdate.c $(LDFLAGS)

install: all
	mkdir -p $(bindir)
	$(INSTALL) -m 755 htpdate $(bindir)/htpdate
	mkdir -p $(mandir)/man8
	$(INSTALL) -m 644 htpdate.8 $(mandir)/man8/htpdate.8
	gzip -f -9 $(mandir)/man8/htpdate.8

clean:
	rm -rf htpdate

uninstall:
	rm -rf $(bindir)/htpdate
	rm -rf $(mandir)/man8/htpdate.8.gz
