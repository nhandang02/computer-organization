#Ten: ??ng Th�nh Nh�n
#MSSV: 522H0006
#Ngay: 20/12
#BAITAP: Vi?t ?o?n code nh?p v�o m?t s? nguy�n, n?u ?� l� s? chia h?t cho 3 th� th�ng b�o ra m�n h�nh.

.data
Thongbao: .asciiz "Moi ban nhap vao so nguyen n: "
msg: .asciiz "La so chia het cho 3: "
.text
.globl main
main:
li $v0,4
la $a0, Thongbao
syscall

li $v0,5 
syscall
move $t0, $v0 #n

li $t1, 0  
li $t2, 1 

rem $t3, $t0, 3
beq $t3, $t1, Print
j Exit

Print:
li $v0,4
la $a0, msg 
syscall
	
Exit:
li $v0, 10
syscall