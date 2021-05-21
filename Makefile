# lists all available targets
list:
	@sh -c "$(MAKE) -p no_targets__ | \
		awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {\
			split(\$$1,A,/ /);for(i in A)print A[i]\
		}' | grep -v '__\$$' | grep -v 'make\[1\]' | grep -v 'Makefile' | sort"

# required for list
no_targets__:

VERSION=$$(poetry version -s)
PROJECT="pyproject"

clean:
	@rm -rf build dist .eggs *.egg-info
	@rm -rf .benchmarks .coverage coverage.xml htmlcov report.xml .tox
	@find . -type d -name '.mypy_cache' -exec rm -rf {} +
	@find . -type d -name '__pycache__' -exec rm -rf {} +
	@find . -type d -name '*pytest_cache*' -exec rm -rf {} +
	@find . -type f -name "*.py[co]" -exec rm -rf {} +

fmt: clean
	@poetry run isort src/ tests/
	@poetry run black src/ tests/

hard-clean: clean
	@rm -rf .venv site

doc:
	@poetry run mkdocs build
	@poetry run mkdocs serve

gh-pages:
	@poetry run mkdocs gh-deploy

pypi:
	@poetry build && poetry publish

docker:
	@docker build -t $(PROJECT) .
	@docker tag $(PROJECT) aahnik/$(PROJECT):latest
	@docker tag $(PROJECT) aahnik/$(PROJECT):$(VERSION)

docker-release: docker
	@docker push -a aahnik/$(PROJECT)

release: gh-pages pypi docker-release

tox:
	@poetry run tox

cov:
	@poetry run coverage run && coverage report
