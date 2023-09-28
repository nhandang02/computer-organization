# To chuc may tinh(H)_N1TO1_HK1_2223_502044
# Viet chuong trinh nhap vao mot chuoi ky tu, xuat ra chuoi nguoc lai
# DangThanhNhan(522H0006)_22H50201

.data
	noti_size: 	.asciiz "Nhap size chuoi: "
	noti_in: 	.asciiz "Nhap chuoi: "
	noti_out: 	.asciiz "\nChuoi nguoc lai la: "
	string:		.asciiz
.text
.globl main
main:
    	# Read length of string	
	li $v0, 4
	la $a0, noti_size
	syscall	
		
	li $v0, 5
	syscall
	move $t1, $v0 
	addi $t1, $t1, 1
	
	# Read string
	li $v0, 4
	la $a0, noti_in
	syscall
	
	li $v0, 8
	la $a0, string
	move $a1, $t1
	syscall
		
	# Print string
	li $v0,4
	la $a0, noti_out
	syscall
	
	addi $t3, $zero, -1		# temp = -1
	
	loop:
		beq $t1, $t3, Exit	# t1 = t3 = -1 => Exit
		la $t0, string		# Load string to t0
		add $t0, $t0, $t1	# t0 = t0 + t1
		lb $a0, ($t0)		# Load byte t0 to a0
		li $v0, 11
		syscall
		addi $t1, $t1, -1	# t1 = t1 - 1
		j loop

    # Exit
    Exit:
		li $v0, 10
		syscall
