rm .jupyterlite.doit.db
rm -rf .cache

rm -rf dist
jupyter lite build --output-dir dist
cp pypi/*.whl dist/extensions/@jupyterlite/pyodide-kernel-extension/static/pypi
