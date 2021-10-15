# ISA Exercise 5 - Calculate Fibonacci number
# Fibonacci: 0 1 1 2 3 5 8 13
# F(0) = 0, F(1) = 1
# F(n) = F(n-1) + F(n-2) , n > 1
#
# MIPS code:
# input number n: $a0
# return: $v0 (print before exit)

.text
main:	
	# prepare params
	li $a0, 8		# input n -> $a0
	
	jal fibonacci		# F(n) -> $v0
	
	add $a0, $v0, $0	# print result ($v0)
	li $v0, 1
	syscall
	j exit

fibonacci:
	addi $t0, $a0, -2
	bgez $t0, subFibonancci
	add $v0, $a0, $0	# if n - 2 < 0 -> return n
	jr $ra

subFibonancci:	
	addi $sp, $sp, -12	# store $a0, $ra, F(n-1)
  	sw $a0, 8($sp)
  	sw $ra, 4($sp)
  	
  	# calc F(n-1)
  	addi $a0, $a0, -1
  	jal fibonacci
  	
  	sw $v0, 0($sp)		# store F(n-1) to $sp
  	
  	# calc F(n-2)
  	addi $a0, $a0, -1
  	jal fibonacci		
  
  	add $t2, $v0, $0	# F(n-2) -> $t2
  	lw $t1, 0($sp)		# F(n-1) -> $t1
  	
  	lw $a0, 8($sp)
  	lw $ra, 4($sp)
  	add $sp, $sp, 12
  	
  	add $v0, $t1, $t2	# F(n) = F(n-1) + F(n-2)
  	
  	jr $ra

exit:
	li $v0, 10
	syscall
