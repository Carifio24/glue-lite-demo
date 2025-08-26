rm .jupyterlite.doit.db
rm -rf .cache

rm -rf dist
jupyter lite build --debug --config jupyter-lite.json --output-dir dist
cp pypi/*.whl dist/extensions/@jupyterlite/pyodide-kernel-extension/static/pypi
