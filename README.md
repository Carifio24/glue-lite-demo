## Usage

On my MacBook, this only seems to work on Python 3.12?

Install dependencies and do pyodide setup:
```bash
./deps.sh
```

Build wheels for fast-histogram and mpl-scatter-density
```bash
./wheels.sh
```

Build the site:

```bash
./build.sh
```

Serve it locally:

```bash
python -m http.server --directory dist 8000
```

Visit 👉 http://localhost:8000
