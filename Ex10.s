.data
	msg1:.asciiz"\nInsira o 1o valor: "
	msg2:.asciiz"\nInsira o 2o valor: "
	res:.asciiz"\nResto da divisão: "
.text
main:
	# Leitura do 1o valor no $t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	# Leitura do 2o valor no $t1
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	ble $t0, $t1, senao
	
se: # $t0 > $t1
	add $t2, $t1, $zero # $t2 - menor
	add $t3, $t0, $zero # $t3 - maior
	j fim

senao: # $t0 <= $t1
	add $t2, $t0, $zero # $t2 - menor
	add $t3, $t1, $zero # $t3 - maior

fim:
	# Resultado inteiro da divisão no $t4
	div $t4, $t3, $t2
	
	# Resultado inteiro multiplicado pelo divisor
	mul $t4, $t4, $t2
	
	# Subtrai do dividendo, obtendo o resto e colocando no $t5
	sub $t5, $t3, $t4
	
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	add $a0, $t5, $zero
	syscall