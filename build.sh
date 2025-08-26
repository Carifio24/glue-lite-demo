rm .jupyterlite.doit.db
rm -rf .cache

rm -rf dist
jupyter lite build --debug --output-dir dist --contents content
cp pypi/*.whl dist/extensions/@jupyterlite/pyodide-kernel-extension/static/pypi
