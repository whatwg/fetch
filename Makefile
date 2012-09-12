ANOLIS = anolis

all: Overview.html data/xrefs/network/cors.json

Overview.html: Overview.src.html data Makefile
	$(ANOLIS) --output-encoding=ascii --omit-optional-tags --quote-attr-values \
	--w3c-compat --enable=xspecxref --enable=refs --w3c-shortname="cors" \
	--filter=".publish, .now3c" $< $@

data/xrefs/network/cors.json: Overview.src.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec
