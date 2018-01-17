.data
#_save: .word 6,6,1,6,6,2,7,6,5 #Estimulo 1.1
_save: .word 6,6,6,6,6,6,6,6,6 #Estimulo 1.2
_k: .word 6
.text
.globl main
main: # inicialização
la $s6, _save          # Base de save
lw $s5, _k             # Carrega k
add $s3, $zero, $zero  # i = 0
Loop: # corpo do laço
sll $t1, $s3, 2
add $t1, $t1, $s6
lw $t0, 0($t1)
bne $t0, $s5, Exit
addi $s3, $s3, 1
j Loop

Exit: # rotina para imprimir inteiro no console
addi $v0, $zero, 1
add $a0, $zero, $s3
syscall
