# venv-new-dir
A Bash script for changing the path of a Python project while preserving its virtual environment and git setup. 

Sometimes I want to reorganize my projects and change up the folder names, but that ends up breaking any venvs if I don't regenerate them. This script automates the task I used to do of renaming or making folders, copying my project's content over, and creating a new venv folder with all the originally installed packages.

Built for using in a UNIX-like system (I used Ubuntu) and for light virtual environemnts in venv (where redownloading the packages doesn't take ages).

## How to use
Place the script in a directory above your Python project.
```
top_level_dir/
├─ venv-new-dir.sh
├─ dev/
│  ├─ python/
│  │  ├─ project/
│  │  │  ├─ .venv/
│  │  │  ├─ python_stuff.py
```
Add user execution permissions: `chmod u+x venv-new-dir.sh`

The script accepts **three** arguments: 
```
./venv-new-dir.sh /abs/path/to/project /new/abs/path/to/project name_of_venv
```

For example, if my project is located in `/home/scott/dev/project` and I want to change it to `/home/scott/github/python/project` and the venv folder is called `.venv`, then I would run
```
./venv-new-dir.sh /home/srenegado/dev/project /home/scott/github/python/project .venv
```

The old directory `/home/scott/dev/project` will still exist.
