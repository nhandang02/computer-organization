#Ten: ??ng Thành Nhân
#MSSV: 522H0006
#Ngay: 20/12
#BAITAP: Vi?t ?o?n cho nh?p m?t s? nguyên d??ng n, và n?u ng??i dùng nh?p s? âm ho?c s? 0 thì yêu c?u nh?p l?i cho ??n khi nào nh?n ???c giá tr? nguyên d??ng.
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
