#makefile

install:
		pip install --upgrade pip &&\
			pip install -r requirements/requirements.txt &&\
				pip install -r requirements/test_requirements.txt &&\
				   pip install build

format:
		black *.py

lint:
		pylint --disable=R,C bikeshare_model/*.py  || true

build:
      
	   python3 bikeshare_model/train_pipeline.py &&\
	   		python3 -m build &&\
				cp dist/bikeshare_model-0.0.1-py3-none-any.whl  bikeshare_model_api


test:
		python3 -m pytest tests/test_*.py

all: install format lint build test
