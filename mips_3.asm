#  Find the value and index of the minimum number of list
.data
iArraySize: .word   10
iArray:     .word   12, 32, 13, 43, 17, 1, -2, -45, 0, 11
numResult:  .asciiz "Minimum number: "
idxResult:  .asciiz "\nIndex: "
.text
main:
### StartCodeHere:

la $t3, iArraySize
lw $t2, 0($t3)

ble $t2, $zero, Exit

la $s2, iArray
addi $t0, $zero, 1
addi $t1, $zero, 4
addi $s1, $zero, 0

li $v0, 1

lw $s0, 0($s2)

While:
   bgt $t0, $t2, Exit
   lw $t1, 0($s2)
   ble $s0, $t1, Continue
   add $s0, $t1, $zero
   add $s1, $t0, -1
Continue:
	addi $s2, $s2, 4
   addi $t0, $t0, 1
	j While
Exit:

### EndCodeHere:
   # print your results
   la    $a0, numResult
   li    $v0, 4
   syscall
   move  $a0, $s0
   li    $v0, 1
   syscall
   la    $a0, idxResult
   li    $v0, 4
   syscall
   move  $a0, $s1
   li    $v0, 1
   syscall
   #stop program
   li    $v0, 10
   syscall
