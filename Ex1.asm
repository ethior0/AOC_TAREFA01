.data
	msg1:.asciiz"\nDigite a largura: "
	msg2:.asciiz"\nDigite o comprimento: "
	res:.asciiz"\nÁrea = "
.text
main:
	# Exibição da msg1
	li $v0, 4
	la $a0, msg1
	syscall
	
	# Leitura da largura e atribuição no reg. t0
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	# Exibição da msg2
	li $v0, 4
	la $a0, msg2
	syscall
	
	# Leitura do comprimento e atribuição no reg. t1
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	# Multiplicação da largura pelo comprimento e atribuição no reg. t2
	mul $t2, $t0, $t1
	
	# Exibição do res
	li $v0, 4
	la $a0, res
	syscall
	
	# Exibição do valor do reg. t2
	li $v0, 1
	add $a0, $t2, $zero
	syscall