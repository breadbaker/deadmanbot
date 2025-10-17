#!/usr/bin/env bash
set -e

# Start Ollama serve in background
ollama serve &
OLLAMA_PID=$!

# Wait for Ollama API to be up
echo "Waiting for Ollama API to be available on port 11434..."
# Use curl; adjust host if needed
until curl -s http://localhost:11434/api/tags > /dev/null; do
  sleep 1
done

# Optionally pull model(s) if not already present
MODEL="gemma3:1b"

if ! ollama list | grep -q "$MODEL"; then
  echo "Pulling model $MODEL..."
  ollama pull "$MODEL"
else
  echo "Model $MODEL already present. Skipping pull."
fi

# Now wait so that serve continues (keep container alive)
wait $OLLAMA_PID
