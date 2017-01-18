BINDIR = ../bin

all:

install:
	install --mode 0444 -D runRShiny.R ${BINDIR}/runRShiny.R
	install --mode 0444 -D server.R ${BINDIR}/server.R
	install --mode 0444 -D ui.R ${BINDIR}/ui.R

clean:

distclean: clean
	rm -rf ${BINDIR}/runRShiny.R
	rm -rf ${BINDIR}/server.R
	rm -rf ${BINDIR}/ui.R

.PHONY: all install clean distclean

