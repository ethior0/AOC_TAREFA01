.data
	msg:.asciiz"\nInsira um valor: "
	int1:.asciiz"\nIntervalo [0-25]:"
	int2:.asciiz"\nIntervalo [26-50]:"
	int3:.asciiz"\nIntervalo [51-75]:"
	int4:.asciiz"\nIntervalo [76-100]:"
	erro:.asciiz"\nNúmero Inválido!"
.text

main:
	# Inicialização dos contadores
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t4, 0

enquanto:
	# Leio o valor no $t0
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	# Caso seja negativo, ele sai do loop
	bltz $t0, mostrar
	
	ble $t0, 25, se1
	ble $t0, 50, se2
	ble $t0, 75, se3
	ble $t0, 100, se4
	bgt $t0, 100, invalido

	j enquanto

se1:
	add $t1, $t1, 1
	j enquanto

se2:
	add $t2, $t2, 1
	j enquanto

se3:
	add $t3, $t3, 1
	j enquanto

se4:
	add $t4, $t4, 1
	j enquanto

invalido:
	li $v0, 4
	la $a0, erro
	syscall
	
	j enquanto

mostrar:
	# Intervalo 1
	li $v0, 4
	la $a0, int1
	syscall
	
	li $v0, 1
	add $a0, $t1, $zero
	syscall

	# Intervalo 2
	li $v0, 4
	la $a0, int2
	syscall
	
	li $v0, 1
	add $a0, $t2, $zero
	syscall

	# Intervalo 3
	li $v0, 4
	la $a0, int3
	syscall
	
	li $v0, 1
	add $a0, $t3, $zero
	syscall

	# Intervalo 4
	li $v0, 4
	la $a0, int4
	syscall
	
	li $v0, 1
	add $a0, $t4, $zero
	syscall
