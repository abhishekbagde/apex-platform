# scripts/compliance/tests/test_example_utility.py
from scripts.compliance.example_utility import multiply_by_two, is_even

def test_multiply_by_two():
    assert multiply_by_two(5) == 10
    assert multiply_by_two(0) == 0
    assert multiply_by_two(-3) == -6

def test_is_even():
    assert is_even(4) == True
    assert is_even(7) == False
    assert is_even(0) == True
