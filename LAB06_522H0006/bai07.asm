#Ten: ??ng Th�nh Nh�n
#MSSV: 522H0006
#Ngay: 20/12
#BAITAP: Vi?t ?o?n cho nh?p m?t s? nguy�n d??ng n, v� n?u ng??i d�ng nh?p s? �m ho?c s? 0 th� y�u c?u nh?p l?i cho ??n khi n�o nh?n ???c gi� tr? nguy�n d??ng.
.data
nhapso: .asciiz "Nhap so nguyen duong n: "

.text 
.globl main
main:

Input:
li $v0, 4 
la $a0, nhapso 
syscall

li $v0, 5 
syscall
move $t2, $v0


li $t3,0
beq $t2,$t3,Input
j sonhohonkhong

sonhohonkhong:
blt $t2,$t3, Input
j Exit


Exit:
li $v0,10
syscall
