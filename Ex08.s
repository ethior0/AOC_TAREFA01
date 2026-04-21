.data
	msg1:.asciiz"\nInsira o valor: "
	res:.asciiz"\nResultado: "
.text
main:
	# Leitura do valor no $t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	# Condição
	bltz $t0, senao
	
se:
	mul $t1, $t0, 2
	j fim

senao:
	mul $t1, $t0, 3

fim:
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t1, $zero
	syscall