# Reverse a String Using a Stack
# - **Task:** Implement a stack data structure to reverse a string.
# - **Function:** `reverse_string(s: str) -> str`
# - **Example:**
#   - Input: `"hello"`
#   - Output: `"olleh"`

def reverse_string(s: str) -> str:
    #Create an empty stack
    stack = []
    
    #Push all characters of the string onto the stack
    for char in s:
        stack.append(char)
    #Pop all characters from the stack and form the reversed string
    reversed_str = []
    while stack:
        reversed_str.append(stack.pop())
    # Join the list of characters to form the reversed string
    return ''.join(reversed_str)

#Calling the function
#hello = input("Type hello")
input_str = "hello"

Expected_Output = reverse_string(input_str)
print("Input String: ", input_str)

print("The Expected Output: ",Expected_Output)