rm -rf dist

voici build --contents content content/glue-lite.ipynb --output-dir dist
cp pypi/*.whl dist/extensions/@jupyterlite/pyodide-kernel-extension/static/pypi
