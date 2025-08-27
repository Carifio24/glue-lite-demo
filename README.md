# glupyter-lite

This repository contains a demo of running glue-jupyter inside of [JupyterLite](https://jupyterlite.readthedocs.io/en/stable/) - that is, completely in the browser.

This wasn't entirely trivial to set up - we have some dependencies with C extensions that we need to build wheels via pyodide/emscripten, and I had to make a few tweaks to glue-jupyter itself to get this to work. The branch that's being used is [here](https://github.com/Carifio24/glue-jupyter/tree/glue-lite). The notebook under `content/glue-lite.ipynb` has a short description of the technical changes that were necessary.

The creation of the necessary wheels and the site setup is handled via the Actions workflow and the various scripts in this repository. One item that isn't automated (yet) is that we need to update the name of the glue-jupyter wheel whenever the branch commit changes.

See the live demo [here](https://carifio24.github.io/glue-lite-demo/lab/index.html)
