# notes for the application of anaconda
# .yml 檔案是 project specification file
# YAML 檔案包含 conda packages, commands, 以及其他檔案
# YAML 說明: http://www.yaml.org/start.html

# first we need to make sure that anaconda-project has been installed.
# 下載 anaconda-project
conda install anaconda-project -y

# inspect what packages are required for this project
# 看看 anaconda-project 需要那些套件
anaconda-project list-packages

# to create an environment to contain the needed packages
# this will create an envs/default directory for your project
anaconda-project prepare

# to determine if the project itself has a defined command
anaconda-project list-commands

# run a list-commands: use run

# Initialize a new project
# 開啟一個 anaconda 專案: anaconda project
anaconda-project init # 此時會產生 anaconda-project.yml 檔案

# anaconda 可以支援: (1) Unix commands (2) Windows commands (3) Bokeh App (4) Jupyter Notebook

# commands are added to projects
anaconda-project add-command



##### Add packages and commands
# add packages to anaconda-projects: python=3, pandas, statsmodels
anaconda-project add-packages python=3 pandas statsmodels

# download mortgage file
anaconda-project add-download MORTGAGE_RATES https://goo.gl/jpbAsR

# open forcast.py and edited line 9
MORTGAGE_RATES = os.environ["MORTGAGE_RATES"]

# add a command, and run the command
anaconda-project add-command --type unix forecast "python forcast.py"
anaconda-project run forecast

#### Locking package version
# request to update all packages using
anaconda-project update
# look for the exact package version
anaconda-project lock


#### Sharing your project
# 將 anaconda 物件打包成 zip 檔案
anaconda-project archive <file_path.zip>
# 登入帳戶
anaconda login
# upload the archive, 需要 --package-type = project 指明這是一個 anaconda project
anaconda upload <zip-file> --package-type = project
