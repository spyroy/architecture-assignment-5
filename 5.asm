#_____________________________TEST_____________________________
#**************************************************************
#.data
#	promptMessege: .asciiz "Enter number "
#	resultMessege: .ascii "\nthe answer is "
#	theNumber: .word 0
#	theAnswer: .word 0
#.text				
#	.globl main
#	main:
#		li $v0, 4
#		la $a0, promptMessege
#		syscall
#		
#		li $v0, 5
#		syscall
#		
#		sw $v0, theNumber
#		
#		lw $a0, theNumber
#		jal SUM_N
#		sw $v0, theAnswer
#		
#		li $v0, 4
#		la $a0, resultMessege
#		syscall
#		
#		li $v0, 1
#		lw $a0, theAnswer
#		syscall
#		
#		li $v0, 10
#		syscall
#		
#	.globl SUM_N
#**************************************************************
	SUM_N:
	addi	$sp,	$sp,	-8	 	# allocate space on stack
	sw	$ra,	0($sp)			# store	the return address
	sw	$a0,	4($sp)			# store	the argument
	slti $t0,	$a0,	1 		# check	if n > 0
	beq	$t0,	$0,	REC	 	# if n > 0 go to rec 
	add	$v0,	$0,	$0		
	addi	$sp,	$sp,	8		
	jr	$ra				# return
	REC:
	addi	$a0,	$a0,	-1		# calculate n-1
	jal SUM_N				# call	SUM_N(n-1)
	lw	$ra,	0($sp)			 
	lw	$a0,	4($sp)			
	addi	$sp,	$sp,	8		
	add	$v0,	$a0,	$v0		#calculate n + SUM_N(n-1)
	jr	$ra
		