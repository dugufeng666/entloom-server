# Entloom Server

The open-source backend for **Entloom**, an enterprise ontology and agent platform.

Entloom Server provides the API and domain services for projects, ontologies, datasets, validation, evidence, queries and agent integrations. It borrows the useful engineering discipline of enterprise admin platforms such as RuoYi, while keeping the product model centered on ontology and AI engineering instead of generic CRUD screens.

> The repository is an early public foundation. APIs and database schemas may change before the first stable release.

## What is included

- Java 25 and Spring Boot 4.1.2
- Spring Modulith for a modular-monolith starting point
- Spring Security, validation, Actuator and Flyway
- PostgreSQL 18 for durable data
- Redis 8.2 for caching and short-lived coordination
- Docker Compose for local PostgreSQL, Redis and the server
- A versioned API namespace at `/api/v1`

The frontend lives in the companion repository: [entloom-ui](https://github.com/dugufeng666/entloom-ui).

## Quick start with Docker

Requirements: Docker Desktop with Compose v2.

```bash
git clone https://github.com/dugufeng666/entloom-server.git
cd entloom-server
make docker-up
curl http://localhost:8080/actuator/health
curl http://localhost:8080/api/v1/hello
```

Stop local services with:

```bash
make docker-down
```

## Local development

Use Java 25 and the Maven wrapper:

```bash
cp .env.example .env
./mvnw test
./mvnw spring-boot:run
```

The default local profile expects PostgreSQL on `localhost:5432` and Redis on `localhost:6379`. `application-test.yml` uses an in-memory H2 database so the test suite does not require external services.

## Architecture direction

The first release is a modular monolith. The initial module boundaries are:

| Module | Responsibility |
| --- | --- |
| `iam` | Users, organizations, roles, permissions and tenants |
| `project` | Projects, versions and ownership |
| `ontology` | Classes, attributes, relations and model versions |
| `dataset` | Imports, source files, records and lineage |
| `validation` | Completeness, references, duplicates and quality checks |
| `query` | Parameterized queries and evidence |
| `agent` | Agent tools, providers and controlled actions |
| `audit` | Security and business audit records |

We will split a module into a separate service only after a measured need appears. The public API contract is more important than early microservice count.

## Repository layout

```text
src/main/java/io/entloom/server/
├── api/          # HTTP adapters
├── config/       # application and security configuration
└── <domain>/     # business modules as they are introduced
deploy/           # deployment notes and environment examples
scripts/          # repeatable local and container commands
```

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md) before opening an issue or pull request. Small, focused changes with tests and documentation are preferred. Please do not submit customer data, credentials or private project files.

## Security

Please follow [SECURITY.md](SECURITY.md) for vulnerability reports. Do not open a public issue containing a credential or an exploitable private finding.

## License

Entloom Server is licensed under the [Apache License 2.0](LICENSE). The license covers source code. Brand assets, private learning materials, paid IMA content and customer data are not part of this repository.
