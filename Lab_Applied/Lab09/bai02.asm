# To chuc may tinh(H)_N1TO1_HK1_2223_502044
# Viet chuong trinh nhap vao 2 so nguyen a, b. Xuat ra man hinh ket qua cua bieu thuc ab - 12b + 7a (Dung stack)
# DangThanhNhan(522H0006)_22H50201

.data
 	nhapa: .asciiz "Nhap so a: "
 	nhapb: .asciiz "Nhap so b: "
 	xuat: .asciiz "Ket qua la: "
.text
.globl main
main:
 	li $v0,4
 	la $a0,nhapa
 	syscall
 
 	li $v0,5
 	syscall
 	move $s1,$v0
 
 	li $v0,4
 	la $a0,nhapb
 	syscall
 
 	li $v0,5
 	syscall
 	move $s2,$v0
 
 	mulu $s3,$s1,$s2
 	sw $s3,($sp)
 	subu $sp,$sp,4
 
 	li $s4,-12
 	mulu $s3,$s4,$s2
 	sw $s3,($sp)
 	subu $sp,$sp,4
 
 	mulu $s3,$s1,7
 	sw $s3,($sp)
 	subu $sp,$sp,4
 
 	li $s4,0
 	li $s5,0
 	xuli:
  		lw $s3,($sp)
  		addu $sp,$sp,4
  		addu $s4,$s4,$s3
  		add $s5,$s5,1
  		bne $s5,4,xuli
  
 		li $v0,4
 		la $a0,xuat
 		syscall
 
 		li $v0,1
 		move $a0,$s4
 		syscall
   
 		li $v0,10
 		syscall
.end main
