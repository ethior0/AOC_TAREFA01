.data
	msg1:.asciiz"\nDigite as horas trabalhadas: "
	msg2:.asciiz"\nDigite as horas extras trabalhadas: "
	msg3:.asciiz"\nDigite o desconto (Ex.: 25): "
	res1:.asciiz"\nSalário bruto: R$ "
	res2:.asciiz"\nSalário líquido: R$ "
.text
main:
	# Leitura das horas trabalhadas no $t0
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	# Leitura das horas extras no $t1
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	# Leitura do desconto no $t2
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	add $t2, $v0, $zero
	
	# Calc salário bruto no $t5
	mul $t3, $t0, 10
	mul $t4, $t1, 15
	add $t5, $t3, $t4
	
	li $v0, 4
	la $a0, res1
	syscall
	
	li $v0, 1
	add $a0, $t5, $zero
	syscall
	
	# Calc salário líquido
	li $t3, 100
	sub $t2, $t3, $t2
	
	mul $t5, $t5, $t2
	div $t6, $t5, $t3
	
	li $v0, 4
	la $a0, res2
	syscall
	
	li $v0, 1
	add $a0, $t6, $zero
	syscall