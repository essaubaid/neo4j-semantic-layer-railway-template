# LangServe Symantec App Template

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/ig4r8_?referralCode=C0ESXA)

## Overview
Template to deploy a FastAPI web server (via LangServe) backed by a Neo4j-powered semantic layer. This repo provides a one-click local setup for testing and a one-click Railway deploy for production.

- Local: run everything (API + Neo4j) with a single docker compose command.
- Railway: deploy using the button above.
- Demo: uses the LangChain semantic layer template; chat at `/neo4j-semantic-layer/playground`.

## Quickstart (Local)
Prerequisites: Docker, Docker Compose, an OpenAI API key.

1) Create a `.env` file in the project root with at least:
```bash
OPENAI_API_KEY=sk-...
NEO4J_PASSWORD=pleasechangeme
```

2) Start services:
```bash
docker compose up -d
```

3) Ingest demo data (first run only):
```bash
# runs the one-off compose service named "ingest" (defined in docker-compose.yml)
docker compose run --rm ingest
```
If you don’t use the `ingest` service, you can run it through the app container:
```bash
docker compose exec app bash -lc "python packages/neo4j-semantic-layer/ingest.py"
```

4) Open:
- API docs: http://localhost:8080/docs
- Playground: http://localhost:8080/neo4j-semantic-layer/playground
- Neo4j Browser: http://localhost:7474 (login: neo4j / your password)

## Deploy to Railway
1) Click the “Deploy on Railway” button above and follow the prompts. The template provisions both the app and a Neo4j service.
2) Set variables when prompted (see grid below). For Neo4j, set only `NEO4J_AUTH`.
3) After deploy, run the ingestion once to load the demo dataset, for example as a one-off command on the app service:
```bash
python packages/neo4j-semantic-layer/ingest.py
```

## Environment variables

### App service

| Variable | Description | Required (Local) | Required (Railway) |
|---|---|---|---|
| 🔑 OPENAI_API_KEY | OpenAI API key used by the agent | Yes | Yes |
| 🗄️ NEO4J_URI | Neo4j Bolt URI (e.g., `bolt://neo4j:7687` locally; Railway internal host) | No (defaults via compose) | Yes |
| 👤 NEO4J_USERNAME | Neo4j username (default `neo4j`) | No (defaults via compose) | Yes |
| 🔒 NEO4J_PASSWORD | Neo4j password | From compose `.env` | Yes |

### Neo4j service

| Variable | Description | Required |
|---|---|---|
| 🔐 NEO4J_AUTH | Neo4j auth in `user/password` form (e.g., `neo4j/pleasechangeme`) | Yes |

## Endpoints

## Name ideas
- NeoServe Graph Template
- RailGraph LangServe
- GraphSense LangServe
- NeoLayer App Template
- OpenAPI docs: `/docs`
- Semantic layer playground: `/neo4j-semantic-layer/playground`

## Notes
- For the demo to work, run `packages/neo4j-semantic-layer/ingest.py` (or `scripts/ingest.sh`) once to populate the database.
