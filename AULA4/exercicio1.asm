.data
# Arranjo inicializado com elementos N não nulos. O valor de N é provido no relatório.
_array: .word 3:N		# N palavras com o valor 3
_size: .word N  		# tamanho do arranjo
.text
.globl main
main:
jal clear1	# Salto para o endereço do procedimento
li $v0, 10	# Exit syscall
syscall

clear1:
# inicialização dos parâmetros
la $a0, _array
lw $a1, _size
# Prólogo do laço. Deve conter uma única instrução de inicialização do índice.
# prologo {
   add $t0, $zero, $zero
# }
# Teste, corpo e iteração do laço.
# corpo {
Loop1:
  slt $t3, $t0, $a1
  beq $t3, $zero, Exit
  sll $t1, $t0, 2
  add $t2, $a0, $t1
  sw $zero, 0($t2)
  addi $t0, $t0, 1
  j Loop1
# }
# Epílogo do procedimento
Exit:
jr $ra  # Retorna ao programa principal
