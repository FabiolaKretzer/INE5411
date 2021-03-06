.data
# Arranjo inicializado com elementos N não nulos. O valor de N é provido no relatório.
_array: .word 3:N		# N palavras com o valor 3
_size: .word N  		# tamanho do arranjo
.text
.globl main
main:
jal clear2	# Salto para o endereço do procedimento
li $v0, 10	# Exit syscall
syscall

clear2:
# inicialização dos parâmetros
la $a0, _array
lw $a1, _size
# Prólogo do laço. Deve conter uma única instrução de inicialização de p.
# prologo {
  addi $t0, $a0, 0
 # }
# Teste, corpo e iteração do laço.
# corpo {
Loop2:
  sll $t2, $a1, 2
  add $t2, $a0, $t2
  slt $t3, $t0, $t2
  beq $t3, $zero, Exit
  sw $zero, 0($t0)
  addi $t0, $t0, 4
  j Loop2
# }
# Epílogo do procedimento
Exit:
jr $ra  # Retorna ao programa principal
