# PLC-Pascal Interpreter in Haskell

# Dhruv Patel and Jonathan Huang Project 1 ReadMe File

# RUN THE CODE:
    WARNING: You need to have cabal installed on your classpath for this to work properly. You also need Alex and Happy, so you can run 
    'cabal install happy && cabal install alex' to get them installed
    1. cd into the 'Code' directory
    2. Only run 'cabal build' if you do not have the 'dist' file to compile the code.
    3. run the command: './run.sh' 
    //This will run all the tests for the projects using the command 
    ' ./dist/build/Pascal/Pascal tests/(NAME OF TEST)', which will run the test cases based off of the executable file precreated or created from step 2.

# SUMMARY:
    These 3 steps should be all that you need in order to run the code effectively with the files given in the project folder.

    --------------------------------------------------------------
    ***scopingTest will throw an exception because it tries to write a variable to the terminal that does not exist. It was created inside of the while loop, showing that the scoping works.
    --------------------------------------------------------------

    **Each test outputs every line of code that performs an action, so if you look at an individual test and look at the run for it, they should match logically.
    ** For further details about the tests, look below.

# TESTING DESCRIPTION:
    Test 1 (variableDeclarations): This tests the variable declarations and shows variables getting put into the global map.

    Test 2 (variableDefinitions): This tests the variable declarations and shows variables getting put into the global map, and variables getting assigned actual values in the map.

    Test 3 (realAndBoolTest): This tests the variable declarations and shows variables getting put into the global map, and variables getting assigned actual values in the map. It is an extension of the previous test, but it also has an AND statement at the end.

    Test 4 (addTest): This tests variables getting declared above the begin statement of the program. Then it performs arithmetic operations on them based of of not only floats, but also real numbers in their variable string form. The program goes through the map and makes sure that the element is in the map and then finds its value to be added.
    
    Test 5 (arithmeticTest): This tests basic arithmetic with variables. Parenthesis and order of operations work perfectly.

    Test 6 (booleanTest): This tests boolean operations and logic with variables. Everything works perfectly.

    Test 7 (precedenceTest): This tests the precedence of operators further than the basic arithmetic tests with variables.

    Test 8 (trigFunctions): This test the trig functions that we had to incorporate. All of them work, and you can also input '3.14159265358979' as an added bonus to get a specific answer.

    Test 9 (ifStatement): This is a basic if statement and demostatres the interpreter's ability to interpret it properly.

    Test 10 (IfElse): Tests If-then else statements:  The first case is true, which returns '12', and the second case is false, which returns false.

    Test 11 (IfElsePart2): This is another if-then else statement test. However, this time the conditions are with boolean logic rather than arithmetic. 

    Test 12 (longTest): This is a test case testing basically everything that was necessary to incorporate in this project. It all should work perfectly, but if you want more in depth test cases, look through the test cases which are named according to what they test.

    Test 13 (whileLoop): This is a while loop test that adds 12.5 to the hello variable inside the loop that iterates until the condition is false. This outputs 73.0 as the final value for the hello reassignment.

    Test 14 (forLoopTest): This test loops through and prints out the value of 'a' for each iteration of the test. You can see the result in the terminal.

    Test 15 (writeln): This tests the writeln/readln functions. The output should be the value of the variables that are inside the parenthesis for the writeln function.

    Test 16 (scopingTest): This tests scoping by calling a variable that does not exist inside program. The variable only exists inside the while loop, and then is attempted to be accessed outside of the while loop in a writeln call.
