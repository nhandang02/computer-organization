.data
msg:.asciiz "Nhap 2 so nguyen:\n"
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
# Nhap so nguyen thu hai
	li $v0, 5 
	syscall 
	move $t2, $v0 
# Doi kieu du lieu thanh float		
	
	mtc1  $t1, $f1             
	mtc1  $t2, $f2	    
	cvt.s.w  $f1, $f1	  
	cvt.s.w  $f2, $f2	   
	div.s  $f3, $f1, $f2	   
# Print thuong
	li $v0, 2 
	mov.s $f12, $f3
	syscall	
# Thoát
	li $v0, 10
	syscall