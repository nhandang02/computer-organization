.data
msg:.asciiz "Nhap 2 so  nguyen cach nhau boi Enter:\n"
newline:.asciiz "\n"
.text
.globl main
main : 
# Print string msg
	 li $v0,4
	la $a0,msg
	syscall
		
# Nhap so nguyen thu nhat 
	li $v0,5	
	syscall 	
	move $t1,$v0 
# Nhao so nguyen thu hai
	li $v0, 5 
	syscall # 
	move $t2, $v0 
# T�nh hi?u
	sub $t3, $t1, $t2
# T�nh t�ch
	mul $t4, $t1, $t2 
# print hi?u
	li $v0, 1 
	move $a0, $t3 
	syscall
# Print string newline
	li $v0,4
	la $a0,newline
	syscall	
# print t�ch
	li $v0, 1 
	move $a0, $t4
	syscall	
# Tho�t
	li $v0, 10
	syscall	
