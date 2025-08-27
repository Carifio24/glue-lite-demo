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
# pyodide build https://files.pythonhosted.org/packages/f8/66/159f38d184f08b5f971b467f87b1ab142ab1320d5200825c824b32b84b66/pyzmq-27.0.2.tar.gz
pyodide build https://files.pythonhosted.org/packages/38/97/a2d667c98b8474f6b8294042488c1bd488681fb3cb4c3b9cdac1a9114287/glfw-2.9.0.tar.gz
pyodide build https://files.pythonhosted.org/packages/e8/77/04a9b4b5caa6e6b3a2f633b15dec0996c1559fc26e9ba73bb3d1d844c874/fast_histogram-0.14.tar.gz
pyodide build https://files.pythonhosted.org/packages/f1/8c/f5c1ddc7d35f0337b2698b52e60f558db3bf03e80ec0b13b8f8b9e2cf2e8/mpl_scatter_density-0.8.tar.gz
pyodide build https://files.pythonhosted.org/packages/09/ce/1eb500eae19f4648281bb2186927bb062d2438c2e5093d1360391afd2f90/tornado-6.5.2.tar.gz
pyodide build https://files.pythonhosted.org/packages/28/42/5deae312e638a3b33732f69929fc4952a2f68cc8b85a4a642f4e373446b4/glue_core-1.23.0.tar.gz
pyodide build https://files.pythonhosted.org/packages/86/fc/11defa00c81179fa6c8443c1ec95d1566522680fef0004bf22b1eaad6310/glue_jupyter-0.24.0.tar.gz

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
