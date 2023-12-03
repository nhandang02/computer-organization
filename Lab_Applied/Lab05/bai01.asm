.data
	readx: .asciiz "Nhap so x: "
	ready: .asciiz "Nhap so y: "
	answer: .word 0
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
	
	jal power
	sw $v0,answer
	
	li $v0,1
	lw $a0,answer
	syscall
	
	li $v0,10
	syscall
.end main

.globl power
.ent power
power:
	li $t0,0 
	li $v0,1 
powLoop:
	mul $v0,$v0,$t1 
	addi $t0,$t0,1 
	blt $t0,$t2,powLoop
	jr $ra
.end power
