#Ten: ??ng Th�nh Nh�n
#MSSV: 522H0006
#Ngay: 20/12
#BAITAP: Nh?p v�o hai s? nguy�n d??ng a v� b, t�nh t?ng c�c s? nguy�n d??ng c� gi� tr? n?m trong ?o?n [a, b].
.data
input1: .asciiz "Nhap so nguyen duong a: "
input2: .asciiz "Nhap so nguyen duong b: "
.text 
.globl main
main:
li $v0, 4 
la $a0, input1 #a
syscall

li $v0, 5 
syscall
move $t1, $v0

li $v0, 4 
la $a0, input2 #b
syscall

li $v0, 5 
syscall
move $t2, $v0

li $t0, 0  

blt $t1,$t2,mangab
j mangba


mangab:
bgt $t1, $t2, ExitLoop # N?u i>n tho�t kh?i v�ng l?p
add $t0, $t0, $t1 # sum = sum + i
add $t1, $t1, 1 # i = i+1
j mangab

mangba:
bgt $t2, $t1, ExitLoop # N?u i>n tho�t kh?i v�ng l?p
add $t0, $t0, $t2 # sum = sum + i
add $t2, $t2, 1 # i = i+1
j mangba

ExitLoop:
li $v0,1
move $a0, $t0
syscall

# Exit
li $v0,10
syscall


