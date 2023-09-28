.data
msg:.asciiz "Nhap 2 so thuc :\n"
.text
.globl main
main : 
# Print string msg
	li $v0, 4
	la $a0, msg
	syscall
# Nhap so thuc 1
	li $v0, 6	
	syscall 	
	mov.s $f1, $f0 
# Nhap so thuc 2 
	li $v0, 6	
	syscall 	
	mov.s $f2, $f0
# Tong 2 so thuc  
	add.s $f3, $f1, $f2
# print tong
	li $v0, 2 
	mov.s $f12, $f3
	syscall	
# Thoát
	li $v0, 10
	syscall		