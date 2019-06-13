# Linear Algebra Programming

'''
Vectors
'''

import math
from functools import reduce

# dataset containing height, weight, age is 3D vector.
height_weight_age = [70, 170, 40]

# dataset containing student exam scores for four courses is 4D vector
grades = [95, 80, 75, 62]

# Sum, Subtraction, Addition, Multiplication
def vector_add(v, w):
    # adds corresponding elements
    return [v_i + w_i
            for v_i, w_i in zip(v,w)]

def vector_subtract(v, w):
    # subtracts corresponding elements
    return [v_i - w_i
            for v_i, w_i in zip(v,w)]

def vector_sum(vectors):
    return reduce(vector_add, vectors)
	
vector_addition(height_weight_age, grades)

def scalar_multiply(c,v):
    # c is number, v is vector
    return [c * v_i for v_i in v]

def vector_mean(vectors):
    # compute vector whos ith element is mean of ith elements of input vectors
    n=len(vectors)
    return scalar_multiply(1 / n, vector_sum(vectors))


# Dot Product & Sum of Squares
def dot(v,w):
    return sum(v_i * w_i for v_i, w_i in zip(v,w))

def sum_of_squares(v):
    return dot(v,v)

# Distance between vectors
def magnitude(v):
    return math.sqrt(sum_of_squares(v))
	
def distance(v,w):
    return magnitude(vector_subtract(v,w))
	

'''
Matrices
'''

# two-dimensional collection of numbers, lists of lists
A = [[1,2,3],    # Size: 2x3
     [4,5,6]]

B = [[1,2],      # Size: 3x2
     [3,4],
     [5,6]]
	 
def shape(A):
    num_rows = len(A)
    num_cols = len(A[0]) if A else 0 # number of elements in first row
    return num_rows, num_cols

print('Size of A: ', shape(A), '\n'
      'Size of B: ', shape(B))
	  
def get_row(A, i):
    return A[i]

# get jth element of row A_i for each row A_i
def get_col(A, j):
    return [A_i[j] for A_i in A]
	
# Making a matrix function
def make_matrix(num_rows, num_cols, entry_fn):
    # returns num_rows x num_cols matrix whose (i,j) is entry_fn(i,j)
    return[[entry_fn(i,j)               # given i, create list
            for j in range(num_cols)]   # entry_fn(i,0), ...
            for i in range(num_rows)]   # create one list for each element i


def is_diagonal(i,j):
    # 1 on diagonal, 0 everywhere else
    return 1 if i == j else 0

id_matrix = make_matrix(5,5,is_diagonal)
id_matrix


