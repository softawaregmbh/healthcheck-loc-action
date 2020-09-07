#!/bin/bash

# Analyze loc
/scc $@ -f json -o scc-result.json

# Trim json file to only contain relevant data
cat scc-result.json | /jq '.[] | { name: .Name, lines: .Lines, code: .Code, comment: .Comment, blank: .Blank, files: .Count }' > healthcheck-loc.json
chmod 777 healthcheck-loc.json

# Output result to console
echo "$(cat healthcheck-loc.json)"