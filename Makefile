# http://wiki.whatwg.org/wiki/GitHub#Makefile

ANOLIS = anolis

all: Overview.html ../xref/xrefs/network/cors.json

Overview.html: Overview.src.html ../xref Makefile
	$(ANOLIS) --omit-optional-tags --quote-attr-values --xref="../xref" \
	--w3c-compat --enable=xspecxref --enable=refs $< $@

../xref/xrefs/network/cors.json: Overview.src.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec
