.data
	readx: .asciiz "Nhap so x: "
	ready: .asciiz "Nhap so y: "
	write_m: .asciiz "So min la: "
	endln: .asciiz "\n"
	write_M: .asciiz "So MAX la: "
	min: .word 0
	max: .word 0
.text
.globl main
main:
	li $v0,4
	la $a0,readx
	syscall 
	
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,4
	la $a0,ready
	syscall 

	li $v0,5
	syscall
	move $t2,$v0
	
	jal minMAX
	sw $v0,min
	sw $v1,max
	
	li $v0,4
	la $a0,write_m
	syscall 
	li $v0,1
	lw $a0,min
	syscall
	
	li $v0,4
	la $a0,endln
	syscall 
	
	li $v0,4
	la $a0,write_M
	syscall 
	li $v0,1
	lw $a0,max
	syscall
	
	li $v0,10
	syscall
.end main

.globl minMAX
.ent minMAX
minMAX:
	blt $t1,$t2,m
	move $v0,$t2
	move $v1,$t1
	j exit
	m:
		move $v0,$t1
		move $v1,$t2
		j exit
	
	exit:
		jr $ra
.end minMAX