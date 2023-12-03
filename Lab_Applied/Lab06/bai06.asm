#Ten: ??ng Thành Nhân
#MSSV: 522H0006
#Ngay: 20/12
#BAITAP: Vi?t ?o?n code cho nh?p vào 2 s? nguyên a và b, xác ??nh a > b hay b > a hay 2 s? b?ng nhau.
.data
input1: .asciiz "Nhap so nguyen a: "
input2: .asciiz "Nhap so nguyen b: "
same: .asciiz "Hai so bang nhau"
nho: .asciiz "So nguyen a nho hon so nguyen b"
lon: .asciiz "So nguyen a lon hon so nguyen b"
.text 
.globl main
main:
li $v0, 4 
la $a0, input1 
syscall

li $v0, 5 
syscall
move $t2, $v0

li $v0, 4 
la $a0, input2 
syscall

li $v0, 5 
syscall
move $t3, $v0


beq $t2,$t3,bangnhau
j sosanh



sosanh:
blt $t2,$t3,nhohon
j lonhon

lonhon:
li $v0, 4 
la $a0, lon
syscall
j Exit

nhohon:
li $v0, 4 
la $a0, nho
syscall
j Exit

bangnhau:
li $v0, 4 
la $a0, same
syscall
j Exit

Exit:
li $v0,10
syscall