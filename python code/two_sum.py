'''def twosum(t, arr):
    for i in range(1, (len(arr) // 2), 1):
        for j in range(len(arr) - 1, (len(arr) // 2), -1):  # Fixed range syntax
            if arr[i] + arr[j] == t:
                return i, j
    return -1, -1  # No need for `else`, directly return -1, -1

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
t = 7
print(twosum(t, arr))
'''

def two_sum(arr, target):
    left, right = 0, len(arr) - 1
    
    while left < right:
        curr_sum = arr[left] + arr[right]
        
        if curr_sum == target:
            return (arr[left], arr[right])  # Found the pair
        elif curr_sum < target:
            left += 1  # Move left pointer
        else:
            right -= 1  # Move right pointer
    
    return None  # No pair found

# Example
arr = [1, 2, 3, 4, 6, 8, 9]
target = 7
print(two_sum(arr, target))  # Output: (2, 8)


print("palindrom")

def is_palindrome(s):
    left, right = 0, len(s) - 1
    
    while left < right:
        if s[left] != s[right]:  
            return False  # Mismatch found
        left += 1
        right -= 1
        
    return True

# Example
print(is_palindrome("madam"))  # Output: True
print(is_palindrome("hello"))  # Output: False


def remove_duplicates(arr):
    if not arr:
        return 0
    
    i = 0  # Slow pointer
    
    for j in range(1, len(arr)):  # Fast pointer
        if arr[j] != arr[i]:
            i += 1
            arr[i] = arr[j]  # Move unique element
            
    return i + 1  # New length of the array

# Example
arr = [1, 1, 2, 2, 3, 4, 4]
new_length = remove_duplicates(arr)
print(arr[:new_length])  # Output: [1, 2, 3, 4]



