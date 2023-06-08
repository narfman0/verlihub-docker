default: build

build:
	docker build -t narfman0/verlihub .

run:
	docker run -it narfman0/verlihub

run-bash:
	docker run -it narfman0/verlihub /bin/bash
