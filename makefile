#makefile

install:
		pip install --upgrade pip &&\
			pip install -r requirements/requirements.txt &&\
				pip install -r requirements/test_requirements.txt

format:
		black *.py

lint:
		pylint --disable=R,C bikeshare_model/*.py  || true

test:
		python3 -m pytest tests/test_*.py

all: install format lint test