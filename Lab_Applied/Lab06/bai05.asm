#Ten: ??ng Th�nh Nh�n
#MSSV: 522H0006
#Ngay: 20/12
#BAITAP: Vi?t ?o?n code nh?p v�o m?t s? nguy�n, xu?t ra th�ng b�o ?� l� s? d??ng, s? �m hay s? 0.

.data
nhapso: .asciiz "Nhap so nguyen n: "
so0: .asciiz "n la so 0"
soam: .asciiz "n la so am"
soduong: .asciiz "n so duong"
.text 
.globl main
main:
li $v0, 4 
la $a0, nhapso 
syscall

li $v0, 5 
syscall
move $t2, $v0


li $t3,0
beq $t2,$t3,sokhong
j amduong


amduong:
blt $t2,$t3,sonhohonkhong
j solonhonkhong

solonhonkhong:
li $v0, 4 
la $a0, soduong
syscall
j Exit

sonhohonkhong:
li $v0, 4 
la $a0, soam
syscall
j Exit

sokhong:
li $v0, 4 
la $a0, so0
syscall
j Exit

Exit:
li $v0,10
syscall
  