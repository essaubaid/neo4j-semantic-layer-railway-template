#!/usr/bin/env bash
set -euo pipefail

python packages/neo4j-semantic-layer/ingest.py

echo "Ingested data"

