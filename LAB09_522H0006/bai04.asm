# To chuc may tinh(H)_N1TO1_HK1_2223_502044
# Viet chuong trinh nhap vao mot so nguyen N. Xuat ra man hinh so nguoc lai
# DangThanhNhan(522H0006)_22H50201

.data
 nhap: .asciiz "Nhap so n: "
 xuat: .asciiz "So dao nguoc la: "
.text
.globl main
main:
 	li $v0,4
 	la $a0,nhap
 	syscall 
 
 	li $v0,5
 	syscall
 	move $s1,$v0
 
 	li $s3,0
 	loop:
  		rem $s2,$s1,10
  		subu $sp,$sp,4
  		sw $s2,($sp)
  		div $s1,$s1,10
  		add $s3,$s3,1
  		bne $s1,0,loop
  
 		li $v0,4
 		la $a0,xuat
 		syscall 
 
		mul $s4,$s3,4
 		addu $sp,$sp,$s4
 	write: 
  		li $v0,1
  		subu $sp,$sp,4 
  		lw $a0,($sp)
  		syscall
  		sub $s3,$s3,1
  		bne $s3,0,write
 

 		li $v0,10
 		syscall
.end main
