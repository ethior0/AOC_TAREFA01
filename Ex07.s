.data
	msg1:.asciiz"\nInsira um valor: "
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
	
	# Pega o resto do número dividido por 2	
	rem $t1, $t0, 2
	
	# Condição
	bne $t1, 0, senao
	
se:
	add $t2, $t0, 5
	j fim

senao:
	add $t2, $t0, 8

fim:
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t2, $zero
	syscall