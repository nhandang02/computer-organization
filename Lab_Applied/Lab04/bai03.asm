.data
msg:.asciiz "Nhap so nguyen:\n"
.text
.globl main
main : 
# Print string msg
	li $v0,4
	la $a0,msg
	syscall
# Nhap so nguyen  
	li $v0,5	
	syscall 	
	move $t1,$v0 
# Tinh binh phuong 
	mul $t2, $t1, $t1
# In ket qua 
	li $v0, 1 
	move $a0, $t2 
	syscall		
# Thoát
	li $v0, 10
	syscall	
