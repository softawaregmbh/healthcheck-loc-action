# :warning: **NOTE**: This repository is no longer needed/used and therefore archived. :warning:

# HealthCheck LOC Action
Uses [SCC](https://github.com/boyter/scc) to analyze lines of code, trims the result with [JQ](https://github.com/stedolan/jq) and saves the result as `healthcheck-loc.json` file.

## How to use
```
name: healtcheck-loc
on:
  push:
    branches: [ dev ]
  pull_request:
    branches: [ dev ]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2

    - name: LOC Analysis
      uses: softawaregmbh/healthcheck-loc-action@v1.0.0

    - name: Save as artifact
      uses: actions/upload-artifact@v2
      with:
        name: healthcheck-loc
        path: ./healthcheck-loc.json
```

## Development
To test the action locally:
1. Comment int Line 9 in `Dockerfile`
2. Execute in CMD:
    ``` cmd
    > docker image build -t loc:1.0.0 .
    > docker run loc:1.0.0 ./test-prj
    ```

### **!! When editing: Make sure entrypoint.sh is saved with LF line endings !!**

## Demo Result
``` json
[
    {
        "name": "C#",
        "lines": 650450,
        "code": 462762,
        "comment": 2816,
        "blank": 184872,
        "files": 1725
    },
    {
        "name": "Plain Text",
        "lines": 79,
        "code": 60,
        "comment": 0,
        "blank": 19,
        "files": 2
    },
    {
        "name": "XML",
        "lines": 1263,
        "code": 1263,
        "comment": 0,
        "blank": 0,
        "files": 2
    }
]
```