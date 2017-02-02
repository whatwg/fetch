local: fetch.bs
	bikeshed spec fetch.bs fetch.html --md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"

remote: fetch.bs
	curl https://api.csswg.org/bikeshed/ -f -F file=@fetch.bs > fetch.html -F md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"

deploy: fetch.bs
	curl --remote-name --fail https://resources.whatwg.org/build/deploy.sh && bash ./deploy.sh
