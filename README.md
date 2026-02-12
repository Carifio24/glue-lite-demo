# JupyterLite + Xeus-Python + glue-jupyter

This is a minimal JupyterLite project that pre-installs a **xeus-python** WebAssembly kernel plus **glue-jupyter**.

## Quickstart (local)

```bash
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate

pip install -r requirements.txt

# Build the static site into ./_output
jupyter lite build

# Preview locally (serves ./_output)
jupyter lite serve
```

Open the URL printed by `jupyter lite serve`, then open `content/demo.ipynb`.

## Notes

- The `environment.yml` uses **emscripten-forge-4x** packages and **conda-forge** packages hosted on prefix.dev.
- The build step downloads and packs the conda environment into the JupyterLite output (no server runtime).

## Deploy

The contents of `_output/` are static files. Deploy to GitHub Pages, Netlify, S3, etc.
