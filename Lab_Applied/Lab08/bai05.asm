.data
	mang: .word 0
	N: .word 0
	msg1: .asciiz "Nhap N: "
	msg2: .asciiz "Nhap vao mang: "
	output1: .asciiz "\nMang theo thu tu tang dan: "
	space: .asciiz " "
	
.text
.globl main
main: 
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0,5
	syscall
	move $s2,$v0
	sw $t1, N 
	
	li $v0, 4
	la $a0, msg2
	syscall

	
	la $s0, mang
	li $s1, 0
	readLoop:
		li $v0,5
		syscall
		sw $v0,($s0)
		addi $s1,$s1,1
		addi $s0,$s0,4
		bne $s1,$s2,readLoop
	
	li $s1,0
	subi $s3,$s2,1
	j gan
	
lap1:	
	
	addi $s1,$s1,1
	j gan
	
tang:

	addi $t1,$t1,1
	j lap2
	
gan:

	addi $t1,$s1,1
	
lap2: 
	
	la $s0, mang
	mul $t3,$s1,4
	add $s0,$s0,$t3
	lw $t4,($s0)
	
	la $s0, mang
	mul $t2,$t1,4
	add $s0,$s0,$t2
	lw $t5,($s0)
	
	blt $t5,$t4,sort
	j exit
	
sort:
	
	move $t0,$t4
	
	move $t4,$t5
	la $s0, mang
	add $s0,$s0,$t3
	sw $t4,($s0)
	
	move $t5,$t0
	la $s0, mang
	add $s0,$s0,$t2
	sw $t5,($s0)
	
exit:

	bne $t1,$s2, tang
	bne $s1,$s3, lap1
	
	li $v0,4
	la $a0, output1
	syscall
	
	la $s0, mang
	li $s1,0
	
output:
	li $v0,1
	lw $a0,($s0)
	syscall
	
	li $v0,4
	la $a0, space
	syscall
	
	addi $s1,$s1,1
	addi $s0,$s0,4
	bne $s1,$s2,output
	
	li $v0,10
	syscall
	
.end main
