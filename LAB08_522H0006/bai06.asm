.data
	readn: .asciiz "Nhap so n: "
	hoanthien: .asciiz "La so hoan thien"
	nht: .asciiz "Khong la so hoan thien"
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
	
	jal ht
	
	li $v0,10
	syscall
.end main

.globl ht
.ent ht
ht:
	li $t0,0
	li $t3,0 
powLoop:
	addi $t0,$t0,1
	rem $t2,$t1,$t0
	bne $t2,0,exit
	add $t3,$t3,$t0  
	blt $t0,$t1,powLoop
	beq $t3,$t1,exit
	
	li $v0,4
	la $a0,nht
	syscall
	jr $ra
	
	exit:
		li $v0,4
		la $a0,hoanthien
		syscall
		jr $ra
.end ht