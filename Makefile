SHELL=/bin/bash -o pipefail
.PHONY: local remote deploy

remote: fetch.bs
	@ (HTTP_STATUS=$$(curl https://api.csswg.org/bikeshed/ \
	                       --output fetch.html \
	                       --write-out "%{http_code}" \
	                       --header "Accept: text/plain, text/html" \
	                       -F die-on=warning \
	                       -F md-Text-Macro="COMMIT-SHA LOCAL COPY" \
	                       -F file=@fetch.bs) && \
	[[ "$$HTTP_STATUS" -eq "200" ]]) || ( \
		echo ""; cat fetch.html; echo ""; \
		rm -f fetch.html; \
		exit 22 \
	);

local: fetch.bs
	bikeshed spec fetch.bs fetch.html --md-Text-Macro="COMMIT-SHA LOCAL COPY"

deploy: fetch.bs
	curl --remote-name --fail https://resources.whatwg.org/build/deploy.sh
	bash ./deploy.sh
