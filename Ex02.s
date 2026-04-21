.data
	msg1:.asciiz"\nEscreva a qtd de camisetas pequenas: "
	msg2:.asciiz"\nEscreva a qtd de camisetas médias: "
	msg3:.asciiz"\nEscreva a qtd de camisetas grandes: "
	res:.asciiz"\nValor final: R$ "
.text
main:
	# Leitura das camisetas pequenas
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	mul $t0, $v0, 10
	
	# Leitura das camisetas médias
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	mul $t1, $v0, 12
	
	# Leitura das camisetas grandes
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	mul $t2, $v0, 15
	
	add $t3, $t0, $t1
	add $t3, $t3, $t2
	
	# Exibição do valor
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t3, $zero
	syscall
