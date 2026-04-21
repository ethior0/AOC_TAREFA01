.data
	msg1:.asciiz"\nInsira o 1o valor: "
	msg2:.asciiz"\nInsira o 2o valor (diferente de 0): "
	res:.asciiz"\nResultado: "
.text
main:
	# Leitura do 1o valor no $t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
enquanto:
	# Leitura do 2o valor no $t1
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	# Condição do loop
	beqz $t1, enquanto

fim:
	# Divisão
	div $t2, $t0, $t1
	
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t2, $zero
	syscall