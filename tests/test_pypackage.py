"""Modeule docstring."""

from pyproject.module import another_func, function


def test_function() -> None:
    """Testing a function."""
    assert function() == "value"


def test_another() -> None:
    """Testing another function."""
    assert another_func() == "an"
