rm -rf _output

voici build --contents content content/glue-lite.ipynb
cp pypi/*.whl _output/extensions/@jupyterlite/pyodide-kernel-extension/static/pypi
