# Note

Tools used

## Dockerfile

- The Dockerfile copies the `tests/` directory from the host to image's filesystem.
It also runs `poetry install` which will install development dependancies as well.
  - You may choose not to copy the `tests/` directory
  - and you may install only the dependancies required by the application,
    by running `poetry install --no-dev`
- I choose to include the tests and dev dependancies as well because the size of
that is relatively small.
- This also helps to test the the application in the docker environment.
(that is very important)
suppose your python application starts using `chromedriver`
which is already installed in your system. So running tox in your system,
passes all tests.
But you forgot to include a line in the Dockerfile that will install `chromedriver`,
but The build will still be succesful, but your application will fail to run in production.

- To run tests inside the container

  ```shell
  docker run -it pyproject poetry run pytest
  ```

More details to be added soon!
