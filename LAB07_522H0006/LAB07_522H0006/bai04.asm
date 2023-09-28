.data
	msg:	.asciiz 	"Nhap N so nguyen: "
	msg1:	.asciiz 	"Tong cac so chan: "
	msg2:	.asciiz 	"\nTong cac so le: "
	mang:	.word 		0

.text 
.globl main
main:
	#print a string
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	#nhap so nguyen N
	li $s1, 0		#i = 0
	la $s0, mang 
	Loop:
		li $v0, 5
		syscall
		sw $v0, ($s0)
		add $s1, $s1, 1
		add $s0, $s0, 4
		blt $s1, $t0, Loop
		
	#tinh tong chan 
	li $s1, 0		#i = 0
	la $s0, mang 
	li $t1, 0 		#tong = 0
	LoopChan:
		lw $t2, ($s0)
		rem $t3, $t2, 2
		bne $t3, 0, next1
		add $t1, $t1, $t2
		next1:
		add $s1, $s1, 1
		add $s0, $s0, 4
		bne $s1, $t0, LoopChan
		
	#tinh tong le
	li $s1, 0		#i = 0
	la $s0, mang 
	li $t4, 0 		#tong = 0
	LoopLe:
		lw $t7, ($s0)
		rem $t8, $t7, 2
		bne $t8, 1, next2
		add $t4, $t4, $t7
		next2:
		add $s1, $s1, 1
		add $s0, $s0, 4
		bne $s1, $t0, LoopLe
		
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 1
	la $a0, ($t4)
	syscall
	
	#exit
	li $v0, 10
	syscall
.end main
