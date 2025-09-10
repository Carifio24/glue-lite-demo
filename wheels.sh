rm -rf dist

# Download emscripten
if [ ! -d "emsdk" ]; then
  git clone https://github.com/emscripten-core/emsdk.git
  cd emsdk
  # PYODIDE_EMSCRIPTEN_VERSION=$(pyodide config get emscripten_version)
  PYODIDE_EMSCRIPTEN_VERSION="3.1.58"
  ./emsdk install ${PYODIDE_EMSCRIPTEN_VERSION}
  ./emsdk activate ${PYODIDE_EMSCRIPTEN_VERSION}
  source ./emsdk_env.sh
  cd ..
fi

# Build
pyodide build https://files.pythonhosted.org/packages/09/ce/1eb500eae19f4648281bb2186927bb062d2438c2e5093d1360391afd2f90/tornado-6.5.2.tar.gz
pyodide build https://files.pythonhosted.org/packages/1b/2e/ef2697f963111cf1bc83568bbe55f262b7c7c8a72948a6e802a7c236f2c1/vispy-0.15.2.tar.gz
pyodide build https://files.pythonhosted.org/packages/38/97/a2d667c98b8474f6b8294042488c1bd488681fb3cb4c3b9cdac1a9114287/glfw-2.9.0.tar.gz
pyodide build https://files.pythonhosted.org/packages/e8/77/04a9b4b5caa6e6b3a2f633b15dec0996c1559fc26e9ba73bb3d1d844c874/fast_histogram-0.14.tar.gz

# Build our custom glue-jupyter wheel
git clone https://github.com/Carifio24/glue-jupyter.git --branch glue-lite
cd glue-jupyter
pyodide build .
cd ..

# Create directory for wheels and move there
mkdir -p pypi
cp glue-jupyter/dist/*.whl pypi/
cp dist/*.whl pypi/

# Clean up glue-jupyter
rm -rf glue-jupyter

# rm -rf emsdk
