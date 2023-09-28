.data
	readn: .asciiz "Nhap so n: "
	nguyento: .asciiz "La so nguyen to"
	nnt: .asciiz "Khong la so nguyen to"
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
	
	move $t2,$t1
	jal nt
	
	li $v0,10
	syscall
.end main

.globl nt
.ent nt
nt:
	li $t0,1 
	li $v0,0 
powLoop:
	blt $t1,2,exit
	addi $t0,$t0,1
	rem $t3,$t1,$t0
	bne $t3,$v0,exit  
	blt $t0,$t2,powLoop
	
	li $v0,4
	la $a0,nguyento
	syscall
	jr $ra
	
	exit:
		li $v0,4
		la $a0,nnt
		syscall
		jr $ra
.end nt