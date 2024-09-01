# Find the Maximum Element in a List Using a Linked List
# - **Task:** Implement a singly linked list and find the maximum element in the list.
# - **Class:** LinkedList
# - **Method:** find_max() -> int
# - **Example**
#   ```python
#   ll = LinkedList()
#   ll.append(3)
#   ll.append(1)
#   ll.append(4)
#   ll.append(2)
#   print(ll.find_max())  # Output: 4
class Linked:
    def __init__(self, value):
        self.value = value
        self.next = None
class LinkedList:
    def __init__(self):
        self.head = None
    def append(self, value: int):
        #Adding new element to end of the list
        new_linked = Linked(value)
        if not self.head:
            self.head = new_linked
        else:
            current = self.head
            while current.next:
                current = current.next 
            current.next = new_linked
            
    def find_max(self) -> int:
        #Find maximum element in the list
        if not self.head:
            raise ValueError("The list is empty")
        
        max_value = self.head.value
        current = self.head
        
        while current:
            if current.value > max_value:
                max_value = current.value
            current = current.next
        
        return max_value
    
#Linked in Practice
if __name__ == "__main__":
    ll = LinkedList()
    ll.append(3)
    ll.append(1)
    ll.append(4)
    ll.append(2)
    print(ll.find_max()) 