# Contributing to Entloom Server

Thanks for helping build Entloom.

## Before you start

- Read the README and the relevant architecture notes.
- Check existing issues before opening a duplicate.
- Keep changes focused on one domain or one piece of infrastructure.
- Never commit credentials, customer data, local database files or private course material.

## Development checks

Run the narrowest useful checks before opening a pull request:

```bash
./mvnw test
./mvnw verify
```

For changes that affect the HTTP contract, update the API documentation and add an integration test.

## Pull requests

Describe the user-visible behavior, the domain boundary affected, migration impact and verification commands. A pull request should be reviewable without reading the entire repository history.
