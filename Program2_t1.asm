# Elijah Rosal
# CS 2640 
# 11-4-2024
# Program 2: Practice with Conditionals and Loops
# Task 1: Return a Letter Grade from User Input


.macro printing(%str) 	# Macro for printing a given String argument
	li $v0, 4	# Load syscall for print_string
	la $a0, %str	# load the address of the given string
	syscall		# Print String
.end_macro

.macro userInput
	li $v0, 5	# Load syscall for read_int
	syscall		# Read the integer
	move $s0, $v0	# Store the input in $s0
.end_macro

.data
menu_msg: .asciiz "\n\n~~~~~~~~~~~~~~~ MAIN MENU ~~~~~~~~~~~~~~~\n(1)Get Letter Grade\n(2)Exit Program\n\nEnter '1' or '2' for your selection: "
divider: .asciiz "\n------------------------------------------\n"
invalid: .asciiz "Invalid input. Enter either 1 or 2.\n"
score_prompt: .asciiz "\nPlease enter a score as an integer value: "
grade_msg: .asciiz "The grade is: "
exit_msg: .asciiz "\nThe program will now exit."
Agrade: .asciiz "A"
Bgrade: .asciiz "B"
Cgrade: .asciiz "C"
Dgrade: .asciiz "D"
Fgrade: .asciiz "F"
reenter_prompt: .asciiz "\nWould you like to enter a new score?\n(Y)yes   (N)No\n\nEnter 'Y' or 'N' for your selection: "
error_msg: .asciiz "\nInvalid input. Please enter 'Y' or 'N': "
bad_msg: .asciiz "Invlaid grade value. Please enter a grade greater than 0: "

.text

main:

loop:
	printing(menu_msg)		# Print menu_msg
	userInput			# Get an integer value from the user
	
	beq $s0, 1, letter_grade		# Branch to letter_grade when user inputs 1	
	beq $s0, 2, exit			# Branch to exit when user inputs 2
	#blt $s0, 1, invalid_input	# Branch to invalid input if user input is less than 1
	#bgt $s0, 2, invalid_input	# Branch to invalid input if user input is greater than 2
invalid_input:
	printing(invalid)
	j loop
	
letter_grade: 
	printing(divider)		# Print divider
	printing(score_prompt)		# print score_prompt
get_grade:
	userInput			# Get an integer value from the user
	blt $s0, 0, bad_grade		# If the suser input is less than 0, go to error msg
	printing(grade_msg)		# Print grade_msg
	bge $s0, 90, A
	bge $s0, 80, B
	bge $s0, 70, C
	bge $s0, 60, D
	blt $s0, 60, F
	
bad_grade:
	printing(bad_msg)
	j get_grade
A:
	printing(Agrade)
	j reenter
B:
	printing(Bgrade)
	j reenter
C:
	printing(Cgrade)
	j reenter
D:
	printing(Dgrade)
	j reenter
F:
	printing(Fgrade)
reenter: 
	printing(divider)		# Print divider
	printing(reenter_prompt)		# Print the reenter_prompt
get_input:
	li $v0, 12			# Load syscall for read_char
	syscall				# Read the user inputted char
	move $t0, $v0			# Store the input char into $t0
	beq $t0, 'Y', yes		# Check for yes
	beq $t0, 'N', no			# Check for no
	printing(error_msg)		# Print error_msg if none of the above checks worked
	j get_input			# Get reprompted by the error_msg for a valid char
	
yes: 
	j letter_grade
no:
	j loop
exit:
	printing(exit_msg)
	li $v0, 10	# Load syscall for exit
	syscall		# Exit the program
