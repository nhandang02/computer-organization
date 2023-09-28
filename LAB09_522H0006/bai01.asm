# To chuc may tinh(H)_N1TO1_HK1_2223_502044
# Viet chuong trinh nhap vao mot mang gom N so nguyen bat ky (N nhap tu ban phim), xuat mang theo thu tu nguoc lai
# DangThanhNhan(522H0006)_22H50201
.data
 	mang: .word 0
 	n: .asciiz "Nhap so phan tu: "
 	nhap: .asciiz "Nhap mang: "
 	xuat: .asciiz "Mang dao nguoc la: "
 	space: .asciiz " "
.text
.globl main
main:
 	li $v0,4
 	la $a0,n
	syscall
 	li $v0, 5
 	syscall
 	move $s2, $v0
 
 	li $v0,4
 	la $a0,nhap
 	syscall
 
 	la $s0,mang
 	li $s1,0
 	readloop:
  		li $v0,5
  		syscall
  		sw $v0,($s0)
  
  		lw  $t4,($s0)
  		subu $sp,$sp,4
  		sw $t4,($sp)
 
  		addi $s1,$s1,1
  		addi $s0,$s0,4
  		bne $s1,$s2,readloop
  
 		li $v0,4
 		la $a0,xuat
		syscall
 
 		li $s1,0
 	writeloop:
  		li $v0,1
  		lw $a0,($sp)
  		addu $sp,$sp,4
  		syscall
  
  		li $v0,4
  		la $a0,space
  		syscall
  
  		addi $s1,$s1,1
  		bne $s1,$s2,writeloop
  
 		li $v0,10
 		syscall
.end main
