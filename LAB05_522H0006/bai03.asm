.data
	readn: .asciiz "Nhap so n: "
	answer: .word 0
.text
.globl main
main:
	li $v0,4
	la $a0,readn
	syscall 
	li $v0,5
	syscall
	move $t1,$v0
	
	jal gt
	sw $v0,answer
	
	li $v0,1
	lw $a0,answer
	syscall
	
	li $v0,10
	syscall
.end main

.globl gt
.ent gt
gt:
	li $t0,0 
	li $v0,1 
powLoop:
	addi $t0,$t0,1
	mul $v0,$v0,$t0  
	blt $t0,$t1,powLoop
	jr $ra
.end gt
