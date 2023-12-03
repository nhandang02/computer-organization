.data
	msg:	.asciiz 	"Nhap N so nguyen: "
	msg1:	.asciiz 	"Mang la: "
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
	
	#print a string
	li $v0, 4
	la $a0, msg1
	syscall
	
	#xuat mang da nhap
	la $s0, mang
	li $s1, 0
	Printloop:
		li $v0, 1
		lw $a0, ($s0)
		syscall
		add $s1, $s1, 1
		add $s0, $s0, 4
		blt $s1, $t0, Printloop
	#exit
	li $v0, 10
	syscall
.end main
