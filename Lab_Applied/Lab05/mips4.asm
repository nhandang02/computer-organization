.data
	readn: .asciiz "Nhap so n: "
	no: .asciiz "No"
	yes: .asciiz "Yes"
.text
.globl main
main:
	li $v0,4
	la $a0,readn
	syscall 
	li $v0,5
	syscall
	move $t1,$v0
	
	div $t2,$t1,2
	jal cp
	
	li $v0,10
	syscall
.end main

.globl cp
.ent cp
cp:
	li $t0,0 
	li $v0,1 
powLoop:
	addi $t0,$t0,1
	mul $t3,$t0,$t0
	beq $t3,$t1,exit  
	blt $t0,$t2,powLoop
	
	li $v0,4
	la $a0,no
	syscall
	jr $ra
	
	exit:
		li $v0,4
		la $a0,yes
		syscall
		jr $ra
.end cp