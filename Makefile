BIN := "./bin/publisher"
DOCKER_IMG="publisher:develop"

BIN2 := "./bin/consumer"
DOCKER_IMG2="consumer:develop"

build:
	go build -v -o $(BIN)  ./publisher/
run: build
	$(BIN)

build-img:
	docker build \
		-t $(DOCKER_IMG) \
		-f publisher/Dockerfile .

run-img: build-img
	docker run $(DOCKER_IMG)


build2:
	go build -v -o $(BIN2)  ./consumer/
run2: build
	$(BIN2)

build-img2:
	docker build \
		-t $(DOCKER_IMG2) \
		-f consumer/Dockerfile .

run-img2: build-img
	docker run $(DOCKER_IMG2)

	


.PHONY: build run build-img run-img