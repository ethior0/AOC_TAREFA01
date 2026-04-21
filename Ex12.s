.data
	msg:.asciiz"\nInsira a altura: "
	maior:.asciiz"\nAltura do maior: "
	menor:.asciiz"\nAltura do menor: "
.text
main:
	li $t0, 0 # contador 
	li $t2, 0 # menor altura
	li $t3, 0 # maior altura

enquanto:
	# Leitura da altura no $t1
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	# Adiciona no contador
	add $t0, $t0, 1
	
	beq $t0, 15, mostrar
	
	# Branch para atribuir o 1o valor da altura para o menor e maior	
	beq $t0, 1, atribuir
	
	blt $t1, $t2, checaMenor
	bgt $t1, $t3, checaMaior
	
	j enquanto

atribuir:
	add $t2, $t1, $zero
	add $t3, $t1, $zero
	j enquanto

checaMenor:
	add $t2, $t1, $zero
	j enquanto

checaMaior:
	add $t3, $t1, $zero
	j enquanto

mostrar:
	# Mostra menor
	li $v0, 4
	la $a0, menor
	syscall
	
	li $v0, 1
	add $a0, $t2, $zero
	syscall
	
	# Mostra maior
	li $v0, 4
	la $a0, maior
	syscall
	
	li $v0, 1
	add $a0, $t3, $zero
	syscall
	
	
