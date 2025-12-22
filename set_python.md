```bash
cd

brew install pyenv-virtualenv

pyenv install 3.14.0

pyenv global 3.14.0
```

Use 3.14.0 to make a virtual environment and use it in a project

```bash
pyenv virtualenv 3.14.0 1

cd Project

pyenv local 1
```
