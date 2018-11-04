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

mcq = QuestionType.create!(question_type: "MCQ")
short_answer = QuestionType.create!(question_type: "Short Answer")

topic = Topic.find(1)

#=======================================================================================================#

problem = topic.problems.create!(question: "Quick sort algorithm is an example of?",
                  question_type: mcq,
                  remark: "Quick sort divides the list using pivot and then sorts in recursive manner. It uses divide and conquer approach."
)

problem.options.create!(answer: "Greedy approach", is_answer: false)
problem.options.create!(answer: "Improved binary search", is_answer: false)
problem.options.create!(answer: "Dynamic programming", is_answer: false)
problem.options.create!(answer: "Divide and conquer", is_answer: true)

problem.links.create!(link: "https://www.geeksforgeeks.org/quick-sort/")

#=======================================================================================================#

problem = topic.problems.create!(question: "Which data structures are used for Depth-first search (DFS) of a graph?",
                      question_type: mcq,
                      remark: "Queue is used for breadth first traversal whereas stack is used for depth first traversal."
)

problem.options.create!(answer: "Queue", is_answer: false)
problem.options.create!(answer: "Stack", is_answer: true)
problem.options.create!(answer: "None of the above", is_answer: false)

problem.links.create!(link: "https://www.tutorialspoint.com/data_structures_algorithms/depth_first_traversal.htm")
problem.links.create!(link: "http://web.cs.unlv.edu/larmore/Courses/CSC477/bfsDfs.pdf")
#=======================================================================================================#

problem = topic.problems.create!(question: "Which one of the following uses LIFO(Last In First Out) for accessing elements?",
                      question_type: mcq,
                      remark: "Stack uses Last In First Out, while Queue uses FIFO(First In First Out)"
)

problem.options.create!(answer: "Queue", is_answer: false)
problem.options.create!(answer: "Stack", is_answer: true)
problem.options.create!(answer: "None of the above", is_answer: false)

problem.links.create!(link: "https://www.geeksforgeeks.org/stack-data-structure/")
#=======================================================================================================#

problem = topic.problems.create!(question: "Which one of the following is non-linear data structure?",
                      question_type: mcq,
                      answer: "D",
                      remark: "Array, Linked List, and Queues are all linear data structures."
)

problem.options.create!(answer: "Array", is_answer: false)
problem.options.create!(answer: "Linked List", is_answer: false)
problem.options.create!(answer: "Queues", is_answer: false)
problem.options.create!(answer: "Trees", is_answer: true)

problem.links.create!(link: "https://techdifferences.com/difference-between-linear-and-non-linear-data-structure.html")
#=======================================================================================================#

problem = topic.problems.create!(question: "Which one of the following is False about Array and Linked List?",
                      question_type: mcq,
                      remark: "Inserting and deleting a new element in an array of elements is expensive, whereas both insertion and deletion can easily be done in Linked Lists."
)

problem.options.create!(answer: "The size of the arrays is fixed, Linked Lists are Dynamic in size.", is_answer: false)
problem.options.create!(answer: "Both insertion and deletion can easily be done in Array.t", is_answer: true)
problem.options.create!(answer: "Random access is not allowed in Linked Listed.", is_answer: false)
problem.options.create!(answer: "Extra memory space for a pointer is required with each element of the Linked list.", is_answer: false)

problem.links.create!(link: "https://www.geeksforgeeks.org/linked-list-vs-array/")

#=======================================================================================================#

problem = topic.problems.create!(question: "For a binary search algorithm to work, it is necessary that the array (list) must be?",
                      question_type: mcq,
                      remark: "As binary search divides the list and selects a the sub-list to extend search based on comparison of values, it becomes necessary that the array (list) must be in sorted form."
)

problem.options.create!(answer: "sorted", is_answer: true)
problem.options.create!(answer: "unsorted", is_answer: false)
problem.options.create!(answer: "in a heap", is_answer: false)
problem.options.create!(answer: "popped out of stack", is_answer: false)

problem.links.create!(link: "https://www.khanacademy.org/computing/computer-science/algorithms/binary-search/a/binary-search")

#=======================================================================================================#

problem = topic.problems.create!(question: "Which of the below mentioned sorting algorithms are not stable?",
                     question_type: mcq,
                     remark: "Except selection sort, all other soring algorithms are stable."
)

problem.options.create!(answer: "Selection Sort", is_answer: true)
problem.options.create!(answer: "Bubble Sort", is_answer: false)
problem.options.create!(answer: "Merge Sort", is_answer: false)
problem.options.create!(answer: "Insertion Sort", is_answer: false)

problem.links.create!(link: "https://www.geeksforgeeks.org/stability-in-sorting-algorithms/")
problem.links.create!(link: "http://homepages.math.uic.edu/~leon/cs-mcs401-s08/handouts/stability.pdf")
problem.links.create!(link: "https://en.wikipedia.org/wiki/Sorting_algorithm#Stability")

#=======================================================================================================#


topic = Topic.find(2)
#=======================================================================================================#

problem = topic.problems.create!(question: "From the following 4 programming languages: Python, C++, Java, and R How many do you know well?",
                      question_type: mcq,
                      remark: "null"
)

problem.options.create!(answer: "0", is_answer: true)
problem.options.create!(answer: "1", is_answer: true)
problem.options.create!(answer: "2", is_answer: true)
problem.options.create!(answer: ">=3", is_answer: true)

#=======================================================================================================#

problem = topic.problems.create!(question: "Did you ever learn any kinds of functional programming languages?",
                      question_type: mcq,
                      remark: "null"
)

problem.options.create!(answer: "Yes", is_answer: true)
problem.options.create!(answer: "No", is_answer: false)

#=======================================================================================================#

problem = topic.problems.create!(question: "In C programming, Where to place “f” with a double constant 3.14 to specify it as a float?",
                      question_type: mcq,
                      remark: "A floating-point constant without an f, F, l, or L suffix has type double. If the letter f or F is the suffix, the constant has type float. If suffixed by the letter l or L, it has type long double."
)

problem.options.create!(answer: "(float)(3.14)(f)", is_answer: false)
problem.options.create!(answer: "(f)(3.14)", is_answer: false)
problem.options.create!(answer: "3.14f", is_answer: true)
problem.options.create!(answer: "f(3.14)", is_answer: false)

#=======================================================================================================#

problem = topic.problems.create!(question: "In C programming, What function can be used to free the memory allocated by calloc()?",
                      question_type: mcq,
                      remark: "calloc(): Allocates space for an array elements, initializes to zero and then returns a pointer to memory. Free(): Dellocate the space allocated by calloc()"
)

problem.options.create!(answer: "dealloc();", is_answer: false)
problem.options.create!(answer: "strcat();", is_answer: false)
problem.options.create!(answer: "free();", is_answer: true)
problem.options.create!(answer: "memcpy();", is_answer: false)

problem.links.create!(link: "https://www.tutorialspoint.com/cprogramming/c_memory_management.htm")
#=======================================================================================================#

problem = topic.problems.create!(question: "Which of the following is correct about tuples in python?",
                      question_type: mcq,
                      remark: "All of the above options are correct."
)

problem.options.create!(answer: "A tuple is another sequence data type that is similar to the list.", is_answer: false)
problem.options.create!(answer: "A tuple consists of a number of values separated by commas.", is_answer: false)
problem.options.create!(answer: "Unlike lists, however, tuples are enclosed within parentheses.", is_answer: false)
problem.options.create!(answer: "All of the above.", is_answer: true)

#=======================================================================================================#

problem = topic.problems.create!(question: "What is the following function returns item from the list with max value?",
                      question_type: mcq,
                      remark: "max(list) − Returns item from the list with max value."
)

problem.options.create!(answer: "cmp(list)", is_answer: false)
problem.options.create!(answer: "len(list)", is_answer: false)
problem.options.create!(answer: "max(list)", is_answer: true)
problem.options.create!(answer: "min(list)", is_answer: false)

#=======================================================================================================#

problem = topic.problems.create!(question: "In C++, An array can be passed to the function with call by value mechanism.",
                      question_type: mcq,
                      remark: "An array never is passed with call by value mechanism."
)

problem.options.create!(answer: "True", is_answer: false)
problem.options.create!(answer: "False", is_answer: true)

#=======================================================================================================#

topic = Topic.find(3)


#=======================================================================================================#

problem = topic.problems.create!(question: "Have you taken Linear Algebra course before?",
                      question_type: mcq,
                      remark: "null."
)

problem.options.create!(answer: "True", is_answer: true)
problem.options.create!(answer: "False", is_answer: false)

#=======================================================================================================#

problem = topic.problems.create!(question: "Have you taken Probability and Statistics course before?",
                      question_type: mcq,
                      remark: "null."
)

problem.options.create!(answer: "True", is_answer: true)
problem.options.create!(answer: "False", is_answer: false)
