# Download emscripten
rm -rf emsdk
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
PYODIDE_EMSCRIPTEN_VERSION=$(pyodide config get emscripten_version)
./emsdk install ${PYODIDE_EMSCRIPTEN_VERSION}
./emsdk activate ${PYODIDE_EMSCRIPTEN_VERSION}
echo $PWD
source ./emsdk_env.sh

# Build
pyodide build https://files.pythonhosted.org/packages/e8/77/04a9b4b5caa6e6b3a2f633b15dec0996c1559fc26e9ba73bb3d1d844c874/fast_histogram-0.14.tar.gz
pyodide build https://files.pythonhosted.org/packages/f1/8c/f5c1ddc7d35f0337b2698b52e60f558db3bf03e80ec0b13b8f8b9e2cf2e8/mpl_scatter_density-0.8.tar.gz
