# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Instructor.create!(name:  "Admin",
             email: "admin@admin.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true)

Instructor.create!(name:  "Hang Li",
             email: "hangli@tamu.edu",
             password:              "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true)
             
Instructor.create!(name:  "Hanna",
             email: "hanna@tamu.edu",
             password:              "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true)
             
Instructor.create!(name:  "Smith",
             email: "smith@tamu.edu",
             password:              "123456",
             password_confirmation: "123456",
             admin: true,
             activated: false)

Topic.create!(name: "Data Structures and Algorithms")

Topic.create!(name: "Programming")

Topic.create!(name: "Basic Mathematics")


topic = Topic.find(1)

topic.problems.create!(question: "Quick sort algorithm is an example of?
A.  Greedy approach
B.  Improved binary search
C. Dynamic programming
D. Divide and conquer",
                  answer: "D",
                  remark: "Quick sort divides the list using pivot and then sorts in recursive manner. It uses divide and conquer approach."
)

topic.problems.create!(question: "Which data structures are used for Depth-first search (DFS) of a graph?
A. Queue
B. Stack
C. None of the above",
                      answer: "B",
                      remark: "Queue is used for breadth first traversal whereas stack is used for depth first traversal."
)

topic.problems.create!(question: "Which one of the following uses LIFO(Last In First Out) for accessing elements?
A. Queue
B. Stack
C. None of the above",
                      answer: "B",
                      remark: "Stack uses Last In First Out, while Queue uses FIFO(First In First Out)"
)


topic.problems.create!(question: "Which one of the following is non-linear data structure?
A. Array
B. Linked List
C. Queues
D. Trees",
                      answer: "D",
                      remark: "Array, Linked List, and Queues are all linear data structures."
)

topic.problems.create!(question: "Which one of the following is False about Array and Linked List?
A. The size of the arrays is fixed, Linked Lists are Dynamic in size.
B. Both insertion and deletion can easily be done in Array.
C. Random access is not allowed in Linked Listed.
D. Extra memory space for a pointer is required with each element of the Linked list.",
                      answer: "B",
                      remark: "Inserting and deleting a new element in an array of elements is expensive, whereas both insertion and deletion can easily be done in Linked Lists."
)

topic.problems.create!(question: "For a binary search algorithm to work, it is necessary that the array (list) must be?
A. sorted
B. unsorted
C. in a heap
D. popped out of stack",
                      answer: "A",
                      remark: "As binary search divides the list and selects a the sub-list to extend search based on comparison of values, it becomes necessary that the array (list) must be in sorted form."
)

topic.problems.create!(question: "Which of the below mentioned sorting algorithms are not stable?
A. Selection Sort
B. Bubble Sort
C. Merge Sort
D. Insertion Sort",
                      answer: "A",
                      remark: "Except selection sort, all other soring algorithms are stable."
)




topic = Topic.find(2)

topic.problems.create!(question: "From the following 4 programming languages: Python, C++, Java, and R How many do you know well?
A. 0
B. 1
C. 2
D. >=3",
                      answer: "null",
                      remark: "null"
)

topic.problems.create!(question: "Did you ever learn any kinds of functional programming languages?  
A. Yes
B. No",
                      answer: "null",
                      remark: "null"
)

topic.problems.create!(question: "In C programming, Where to place “f” with a double constant 3.14 to specify it as a float?
A. (float)(3.14)(f)
B. (f)(3.14)
C. 3.14f
D. f(3.14)",
                      answer: "C",
                      remark: "A floating-point constant without an f, F, l, or L suffix has type double. If the letter f or F is the suffix, the constant has type float. If suffixed by the letter l or L, it has type long double."
)

topic.problems.create!(question: "In C programming, What function can be used to free the memory allocated by calloc()?
A. dealloc();
B. strcat();
C. free();
D. memcpy();",
                      answer: "C",
                      remark: "calloc(): Allocates space for an array elements, initializes to zero and then returns a pointer to memory. Free(): Dellocate the space allocated by calloc()"
)

topic.problems.create!(question: "Which of the following is correct about tuples in python?
A. A tuple is another sequence data type that is similar to the list.
B. A tuple consists of a number of values separated by commas.
C. Unlike lists, however, tuples are enclosed within parentheses.
D. All of the above.",
                      answer: "D",
                      remark: "All of the above options are correct."
)

topic.problems.create!(question: "What is the following function returns item from the list with max value?
A. cmp(list)
B. len(list)
C. max(list)
D. min(list)",
                      answer: "C",
                      remark: "max(list) − Returns item from the list with max value."
)

topic.problems.create!(question: "In C++, An array can be passed to the function with call by value mechanism.
A. True
B. False",
                      answer: "B",
                      remark: "An array never is passed with call by value mechanism."
)

topic = Topic.find(3)

topic.problems.create!(question: "Have you taken Linear Algebra course before? 
A. yes
B. no",
                      answer: "null",
                      remark: "null."
)

topic.problems.create!(question: "Have you taken Probability and Statistics course before?  
A. yes
B. no",
                      answer: "null",
                      remark: "null."
)