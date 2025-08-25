## Usage

Install dependencies:

```bash
pip install jupyterlite-core jupyterlite-pyodide-kernel
pip install jupyter-server jupyterlab-server
```

Build the site:

```bash
jupyter lite build --output-dir dist
```

Serve it locally:

```bash
python -m http.server --directory dist 8000
```

Visit 👉 http://localhost:8000
