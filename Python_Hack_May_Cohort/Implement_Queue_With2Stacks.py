# Implement a Queue Using Two Stacks
# - **Task:** Implement a queue using two stacks.
# - **Class:** `QueueWithStacks`
# - **Methods:**
#   - `enqueue(x: int)`: Adds an element to the queue.
#   - `dequeue() -> int`: Removes and returns the front element of the queue.
# - **Example:**
#   ```python
#   q = QueueWithStacks()
#   q.enqueue(1)
#   q.enqueue(2)
#   print(q.dequeue())  # Output: 1
#   print(q.dequeue())  # Output: 2
class QueueWithStacks:
    def __init__(self):
        self.stack_in = []
        self.stack_out = []

    def enqueue(self, x: int):
        """Add an element to the queue."""
        self.stack_in.append(x)

    def dequeue(self) -> int:
        """Remove and return the front element of the queue."""
        if not self.stack_out:
            # Transfer elements from stack_in to stack_out if stack_out is empty
            while self.stack_in:
                self.stack_out.append(self.stack_in.pop())
        
        if not self.stack_out:
            raise IndexError("dequeue from empty queue")
        
        return self.stack_out.pop()

# Example usage:
q = QueueWithStacks()
q.enqueue(1)
q.enqueue(2)
print(q.dequeue())  # Output: 1
print(q.dequeue())  # Output: 2
