.data
	msg:	.asciiz 	"Nhap N so nguyen: "
	msg1:	.asciiz 	"Gia tri MAX la: "
	msg2:	.asciiz 	"\nGia tri MIN la: "
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
	#tim MAX
	la $s0, mang
	li $s1, 0 	# i = 1
	lw $t2, ($s0)
	LoopMAX:
		lw $t3, ($s0)
		blt $t3, $t2, next
		move $t2, $t3
		next:
		add $s1, $s1, 1
		add $s0, $s0, 4
		bne $s1, $t0, LoopMAX
	#tim MIN
	la $s0, mang
	li $s1, 0 	# i = 1
	lw $t4, ($s0)
	LoopMIN:
		lw $t5, ($s0)
		bgt $t5, $t4, nextt
		move $t4, $t5
		nextt:
		add $s1, $s1, 1
		add $s0, $s0, 4
		bne $s1, $t0, LoopMIN
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 1
	la $a0, ($t2)
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
