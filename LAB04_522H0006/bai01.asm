.data
input:.asciiz "Sinh vi�n TDTU xin ch�o c�c b?n "
.text
.globl main
main : 
# print input 
li $v0, 4
				
la $a0, input		
syscall			
# exit 
li $v0,10		
syscall		
