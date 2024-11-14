# Elijah Rosal, Caleb Szeto, Ryan Hansen, Cameron Bolanos
# CS 2640 
# 11-13-2024
# Program 2: Practice with Conditionals and Loops
# Task 2: Advanced Math: x to the power of y

.data
prompt_x:    .asciiz "Enter the value of x: "
prompt_y:    .asciiz "Enter the value of y: "
result_msg:  .asciiz "Result (x^y) is: "
newline:     .asciiz "\n"

.text
.globl main

# Main program starts here
main:
    # Prompt the user for x
    li $v0, 4               
    la $a0, prompt_x 	# load prompt_x
    syscall

    # Read integer input for x
    li $v0, 5		# ead_int
    syscall
    move $t0, $v0	# store x in $t0

    # Prompt the user for y
    li $v0, 4		# print_string
    la $a0, prompt_y	# load prompt_y
    syscall

    # Read integer input for y
    li $v0, 5		# read_int
    syscall
    move $t1, $v0	# store y in $t1

    # Initialize result = 1
    li $t2, 1		# $t2 will hold the result

    # Initialize loop counter
    move $t3, $t1	# $t3 will be used as the loop counter (y)

# Calculate x^y
power_loop:
    beq $t3, 0, end_loop     # if y (counter) == 0, exit the loop
    mul $t2, $t2, $t0        # result = result * x
    sub $t3, $t3, 1          # decrement loop counter
    j power_loop             # repeat the loop

end_loop:
    # Print result
    li $v0, 4		# print message
    la $a0, result_msg       
    syscall

    # Print the result value
    move $a0, $t2
    li $v0, 1		# print int
    syscall

    # Print a newline
    li $v0, 4	# print string
    la $a0, newline
    syscall

    # Exit the program
    li $v0, 10
    syscall
