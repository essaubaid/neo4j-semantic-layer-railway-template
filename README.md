# langchain-project

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
docker compose run --rm ingest
```

4) Open:
- API docs: http://localhost:8080/docs
- Playground: http://localhost:8080/neo4j-semantic-layer/playground
- Neo4j Browser: http://localhost:7474 (login: neo4j / your password)

## Deploy to Railway
1) Click the “Deploy on Railway” button above and follow the prompts.
2) Provide required variables when prompted:
   - App service: `OPENAI_API_KEY`, `NEO4J_URI`, `NEO4J_USERNAME`, `NEO4J_PASSWORD`
   - Or use the provided Neo4j service image and set `NEO4J_AUTH=neo4j/<password>` there
3) After deploy, run the ingestion once to load the demo dataset:
   - Run locally pointing to the cloud DB, or
   - Execute `bash /code/scripts/ingest.sh` as a one-off job on Railway.

## Endpoints
- OpenAPI docs: `/docs`
- Semantic layer playground: `/neo4j-semantic-layer/playground`

## Notes
- For the demo to work, run `packages/neo4j-semantic-layer/ingest.py` (or `scripts/ingest.sh`) once to populate the database.
