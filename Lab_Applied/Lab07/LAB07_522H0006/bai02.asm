.data
	msg:	.asciiz 	"Nhap N so nguyen: "
	msg1:	.asciiz 	"Tong cua mang la: "
	msg2:	.asciiz 	"\nTrung binh cua mang la: "
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
	
	#tong mang
	la $s0, mang
	li $s1, 0	#i = 0
	li $t2, 0	#sum = 0
	Printloop:
		lw $t3, ($s0)
		add $t2, $t2, $t3
		add $s1, $s1, 1
		add $s0, $s0, 4
		blt $s1, $t0, Printloop
	
	#Trung binh
	mtc1 $t2, $f2
	cvt.s.w $f2, $f2
	mtc1 $t0, $f0
	cvt.s.w $f0, $f0
	div.s $f4, $f2, $f0
	#print chuoi xuat
	li $v0, 4
	la $a0, msg1
	syscall
	
	#ket qua tong
	li $v0, 1
	la $a0, ($t2)
	syscall

	#print chuoi xuat
	li $v0, 4
	la $a0, msg2
	syscall
	
	#ket qua trung binh
	li $v0, 2
	mov.s $f12, $f4
	syscall
	
	#exit
	li $v0, 10
	syscall
.end main
