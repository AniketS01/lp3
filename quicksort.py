import random


def quicksort(A, i, j):
    if i >= j:
        return A

    pivot = partition(A, i, j, j)
    quicksort(A, i, pivot - 1)
    quicksort(A, pivot + 1, j)


def randomized_quicksort(A, i, j):
    if i >= j:
        return A

    pivot = partition(A, i, j, random.randint(i, j))
    quicksort(A, i, pivot - 1)
    quicksort(A, pivot + 1, j)


def partition(A, i, j, pivot):
    A[j], A[pivot] = A[pivot], A[j]
    store_index = i

    for i in range(i, j):
        if A[i] < A[j]:
            A[store_index], A[i] = A[i], A[store_index]
            store_index += 1

    A[j], A[store_index] = A[store_index], A[j]

    return store_index


A = [5, 4, 2, 1, 7, 6, 3, 8, 9]
quicksort(A, 0, len(A) - 1)
print(A)

A = [5, 4, 2, 1, 7, 6, 3, 8, 9]
randomized_quicksort(A, 0, len(A) - 1)
print(A)