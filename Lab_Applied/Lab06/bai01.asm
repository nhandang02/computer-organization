#Ten: ??ng Thành Nhân
#MSSV: 522H0006
#Ngay: 20/12
#BAITAP: Vi?t ch??ng trình nh?p vào m?t s? nguyên N, tính t?ng các s? t? 1 ??n N
.data
Thongbao: .asciiz "Moi ban nhap vao so nguyen n:"
.text
.globl main
main:
li $v0,4
la $a0, Thongbao
syscall

li $v0,5
syscall
move $t0, $v0 #n

li $t1, 0 #sum = 0 
li $t2, 1 # i= 1
LoopSum:
	bgt $t2,$t0, ExitLoop #neu i < n thoat vong lap 
	add $t1, $t1, $t2 # sum = sum + i
	add $t2,$t2,1 # i = i + 1
	j LoopSum
ExitLoop:
li $v0, 1	
move $a0, $t1	
syscall
		
#Exit
li $v0, 10
syscall