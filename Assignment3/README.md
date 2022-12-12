# Assignment 3 Critical Appraisal

### Sharon Chang
### Submission Date: Dec. 11 2022

# Pseudocode
My pseudocode logic was written in Python. These Python examples use normal lists on account of me deciding that I would be able to retrospectively replace the necessary loops in order to iterate through pointers by referencing the example length function provided in linked-list.lc.
```
def inBetween(val, left, right):
    right.insert(0, val)
    left = left + right
    return left

def insertVal(val, insList):
    pos = 0
    if insList == []:
        return [val]
    else:
        for i in insList:
            if i > val:
                insList.insert(pos, val)
                break
            else:
                pos += 1
    return insList

def sort(sortList):
    newList = []
    for i in sortList:
        newList = insertVal(i, newList)
    return newList

# Main
print (inBetween(3, [1,2], [4,5]))
print (insertVal(3, [1,2,4,5]))
print (sort([6,2,7,5,1,4,9,3,8,0]))
```

# Heap Drawing
Commands:
```
sort (cons 6 (cons 4 (cons 2 nil)));;
```
Environment Heap:
```
0 -> "NULL"
1 -> [2, <address 0>]
2 -> [4, <address 1>]
3 -> [6, <address 2>]
4 -> <address 0>
5 -> <address 23>
6 -> [<address 0>, <address 11>]
7 -> <address 6>
8 -> <address 6>
9 -> true
10 -> [<address 0>, <address 0>]
11 -> [6, <address 0>]
12 -> [<address 0>, <address 17>]
13 -> <address 12>
14 -> <address 12>
15 -> true
16 -> [<address 0>, <address 11>]
17 -> [4, <address 11>]
18 -> [<address 0>, <address 23>]
19 -> <address 18>
20 -> <address 18>
21 -> true
22 -> [<address 0>, <address 17>]
23 -> [2, <address 17>]
```

# Known Bugs
Addresses will very quickly climb to ludicrously high numbers as my method of insert will clone the input list without deleting the original list. This means that memory is very quickly occupied by lists that are not actually being used.

# Observations
I found that it was incredibly simple to get sort going in comparison to insert. Sort was relatively straightforward in applying the logic of repeatedly calling on insert for each element. However, when making insert, I had great difficultly in handling node addresses.

Initially, I thought I could get away with simply overwriting a preexisting node with our insert data and then shifting all the other elements back by 1 address, but this process became nigh impossible to implement on account of the immutability of created nodes. This led me to pivot to instead making a copy of the entire input list as the solution, with the copy containing the inserted data at the appropriate location.

Even when this was accomplished, I was then struck with the problem of outputting the correct address. I was not initially aware of this problem until I tried implementing sort, and discovered that I was encountering issues trying to call on insert within my loop. This is because I had previously set ptr as my output for the insert function, which would output the incorrect address and cause my sort function to throw back non-exhaustive errors at execution time. The return variable was created as a workaround by essentially bookmarking where the new linked list will be prior to executing the loop that actually created the cloned linkedlist.