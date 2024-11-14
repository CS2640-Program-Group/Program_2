#Group
#cs 2640/02
#11/13/24
#program 2 task #2: math

.data
enterForX: .asciiz "Enter a number for 'x': "
enterForY: .asciiz "Enter a number for 'y': "
value: .asciiz "'x' to the power 'y' is: "
newLine: .asciiz "\n"

.text
main:
	#get user input for X
	li $v0, 4
	la $a0, enterForX
	syscall
	
	#move and save value for X
	li $v0, 5
	syscall
	move $s0, $v0
	
	#new line
	li $v0, 4
	la $a0, newLine
	syscall
	
	#get user input for Y
	li $v0, 4
	la $a0, enterForY
	syscall
	
	#move and save value for Y
	li $v0, 5
	syscall
	move $s0, $v0
	
	#new line
	li $v0, 4
	la $a0, newLine
	syscall
loop:
	#end loop condition/loop counter
	beq $t0, 5, exit #change loop end cond
	
	#do da math
	
	#increment loop counter
	add $t0, $t0, 1
	j loop
exit:	
	#print value of result of inputs
	li $v0, 4
	la $a0, value
	syscall
	
	#exit program
	li $v0, 10
	syscall


