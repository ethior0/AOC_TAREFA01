.data
	msg1:.asciiz"\nDigite o valor do 1o cateto: "
	msg2:.asciiz"\nDigite o valor do 2o cateto: "
	res:.asciiz"\nValor da hipotenusa: "
.text
main:
	# Leitura do 1o cateto no $t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	# Leitura do 2o cateto no $t1
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	# Cálculos a² + b²
	mul $t0, $t0, $t0
	mul $t1, $t1, $t1
	add $t2, $t0, $t1
	
	# Cálculo da hipotenusa

	li $t4, 0
	li $t3, 1
	
condicao:
	bge $t2, $t3 enquanto
	j fim
	
enquanto:
	sub $t2, $t2, $t3
	add $t3, $t3, 2
	add $t4, $t4, 1
	
	j condicao

fim:
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t4, $zero
	syscall
	

