rm -rf dist

# Download emscripten
rm -rf emsdk
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
# PYODIDE_EMSCRIPTEN_VERSION=$(pyodide config get emscripten_version)
PYODIDE_EMSCRIPTEN_VERSION="3.1.58"
./emsdk install ${PYODIDE_EMSCRIPTEN_VERSION}
./emsdk activate ${PYODIDE_EMSCRIPTEN_VERSION}
source ./emsdk_env.sh

# Build
pyodide build https://files.pythonhosted.org/packages/e8/77/04a9b4b5caa6e6b3a2f633b15dec0996c1559fc26e9ba73bb3d1d844c874/fast_histogram-0.14.tar.gz
pyodide build https://files.pythonhosted.org/packages/f1/8c/f5c1ddc7d35f0337b2698b52e60f558db3bf03e80ec0b13b8f8b9e2cf2e8/mpl_scatter_density-0.8.tar.gz
pyodide build https://files.pythonhosted.org/packages/28/42/5deae312e638a3b33732f69929fc4952a2f68cc8b85a4a642f4e373446b4/glue_core-1.23.0.tar.gz
pyodide build https://files.pythonhosted.org/packages/86/fc/11defa00c81179fa6c8443c1ec95d1566522680fef0004bf22b1eaad6310/glue_jupyter-0.24.0.tar.gz

cd ..
cp emsdk/dist/*.whl pypi/

rm -rf emsdk
