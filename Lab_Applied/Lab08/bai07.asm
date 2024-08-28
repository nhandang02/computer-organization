.data
	readx: .asciiz "Nhap so x: "
	ready: .asciiz "Nhap so y: "
	uscln: .asciiz "USCLN la: "
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
	
	jal UCLN
	sw $t1,max
	
	li $v0,4
	la $a0,uscln
	syscall 
	li $v0,1
	lw $a0,max
	syscall
	
	li $v0,10
	syscall
.end main

.globl UCLN
.ent UCLN
UCLN:
	loop:	
		bne $t1,$t2,tru
		jr $ra
	tru:
		blt $t1,$t2,a
		blt $t2,$t1,c
	a:	
		sub $t2,$t2,$t1
		j loop
	c:		
		sub $t1,$t1,$t2
		j loop
.end UCLN
