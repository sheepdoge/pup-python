build:
	docker build -t sheepdoge/pup-python .

test: build
	docker run sheepdoge/pup-python /bin/bash -c "./test.sh"

interactive: build
	docker run -it sheepdoge/pup-python /bin/bash
