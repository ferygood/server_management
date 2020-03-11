# previous course: Conda Essentials course4
# download the source code
# create Conda Environment with dependent packages

# 需要 (1) setup.py (2) meta.yaml 兩個來建置 Conda package

# Setp1. Install Conda Build
# install conda-build package
# `conda-build` command will read the Conda recipe and construct a package file
# that can be upload to Anaconda Cloud and installed in a Conda environment

conda install conda-build

# meta.yaml 範例
# meta.yaml 有五個部分: package, source, build, requirement (run, build),
# source 來源可以是 Github 頁面
{% set setup_py = load_setup_py_data() %}
package:
    name:"mortgage_forecasts"
    version: {{ setup_py.get("version") }}
source:
    path: ./
build:
    script: python setup.py install --single-version-externally-managed --record=recird.txt
requirements:
    run:
        # packages that must be installed in the user's conda environment to run this package
        - python >=2.7
        - scipy
        - statsmodels
        - numpy 1.11*
        - matplotlib >=1.5, <2.0
        
    build:
        # packages used by setup.py to install this package.
        # May also install compilers for non-python code
        - python
        - setuptools
about:
    license: {{ setup.py.get("license") }}
    license_file: LICENSE
    summary: {{ setup_py.get("description") }}
    
# Step 2. Build the Conda Package
conda build <package-name> # use conda to build package
conda search --use-local --info <package-name> # verify the metadata using conda search

# Step 3. Install the Conda Package
# 比如上一步 build 的會存在 /home/repl/miniconda/conda-bld/linux-64/ 資料夾
conda create -name models python=3 # 建立一個 conda 環境叫做 models, 並安裝 python=3
conda activate models
conda install --use-local mortgage_forecasts pandas=0.22 # 安裝 mortgage_forecasts 和 pandas(0.22)

# Step 4. Uplaod your file
anaconda upload noarch/mortgage_forcasts-0.1-py_1.tar.bz2 # 會要求你輸入 anaconda cloud 的帳號密碼



