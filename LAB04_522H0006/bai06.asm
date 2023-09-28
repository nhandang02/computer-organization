.data
msg:.asciiz "Nhap chieu dai va chieu rong cua hinh chu nhat:\n"
newline:.asciiz "\n"
.text
.globl main
main : 
# Print string msg
	 li $v0,4
	la $a0,msg
	syscall
		
# Nhap chieu dai
	li $v0,5	
	syscall 	
	move $t1,$v0 
# Nhap chieu rong
	li $v0, 5 
	syscall 
	move $t2, $v0
# Tong 2 canh  
	add $t3, $t1, $t2
# Chu vi hinh chu nhat 
	add $t4, $t3, $t3
# Dien tich hinh chu nhat
	mul $t5, $t1, $t2
# Print chu vi  
	li $v0, 1 
	move $a0, $t4 
	syscall
# Print string newline
	li $v0,4
	la $a0,newline
	syscall	
# Print dien tich  
	li $v0, 1 
	move $a0, $t5 
	syscall			
# Thoát
	li $v0, 10
	syscall