.data
	msg1:.asciiz"\nInsira o valor de A: "
	msg2:.asciiz"\nInsira o valor de B: "
	res:.asciiz"\nResultado: "
.text
main:
	# Leitura do valor A no $t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	# Leitura do valor B no $t1
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	# Condição
	bne $t0, $t1, senao
	
se:
	add $t2, $t0, $t1
	j fim

senao:
	mul $t2, $t0, $t1
	
fim:
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t2, $zero
	syscall
