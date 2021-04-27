IP_ADDRESS := $(shell ipconfig getifaddr en0)

setup:
	git submodule update -i
serve:
	hugo server --buildDrafts --watch --bind=0.0.0.0 --baseUrl=$(IP_ADDRESS)
