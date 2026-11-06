.PHONY: test verify package docker-up docker-down run

test:
	./mvnw -B test

verify:
	./mvnw -B verify

package:
	./mvnw -B -DskipTests package

docker-up:
	docker compose up --build -d

docker-down:
	docker compose down

run:
	./mvnw spring-boot:run
