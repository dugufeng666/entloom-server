# Architecture Notes

Entloom Server starts as a modular monolith. Each domain module owns its application services, persistence model and HTTP adapter. Modules communicate through explicit interfaces and events rather than reaching into each other's repositories.

The first persistence target is PostgreSQL. Redis is used for short-lived coordination and cache entries; it is not the source of truth for ontology or project data. Files and export packages will use an object-storage adapter in a later milestone.

The public server repository contains reusable platform code only. Deployment secrets, enterprise customer data and private operations belong outside the repository.
