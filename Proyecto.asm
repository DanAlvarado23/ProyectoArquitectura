.data
	laberinto: .space 1024
	.eqv SIZE 16
	.eqv BLOQUE 0x88dc65 
	.eqv VACIO 0xf9e4b7
.text 

main:
la $s0, laberinto
li $t6, VACIO
jal llenar
j juego
#termina el programa
li $v0, 10
syscall


juego:
	li $t0, 68 #posicion inicial
	movimiento:
	jal key
	beq $t0, 1016, salidajuego
	li $v0, 12
	syscall
	beq $v0, 119, arriba
	beq $v0, 97, izquierda
	beq $v0, 115, abajo
	beq $v0, 100, derecha
	j movimiento
	salidajuego:
	li $v0, 10
	syscall
	
key:
	beq $t0, 900, key_found
	j key_out
	key_found:
		addi $t3, $zero, 1016
		add $t3, $t3, $s0
		sw $t6, ($t3)
	key_out:
	jr $ra
	
arriba:
	subi $t1, $t0, 64
	add $t1, $t1, $s0 #posicion arriba a la actual 
	lw $t2, ($t1)
	beq $t2, BLOQUE ,movimiento
	j simueve
	
izquierda:
	subi $t1, $t0, 4
	add $t1, $t1, $s0 #posicion izquierda a la actual 
	lw $t2, ($t1)
	beq $t2, BLOQUE ,movimiento
	j simueve
		
abajo:
	addi $t1, $t0, 64
	add $t1, $t1, $s0 #posicion abajo a la actual 
	lw $t2, ($t1)
	beq $t2, BLOQUE ,movimiento
	j simueve		
				
derecha:
	addi $t1, $t0, 4
	add $t1, $t1, $s0 #posicion derecha a la actual 
	lw $t2, ($t1)
	beq $t2, BLOQUE ,movimiento
	j simueve
	
simueve:
	add $t0, $t0, $s0
	sw $t6, ($t0) #pone un blanco en la posicion que estaba antes
	sw $t7, ($t1) #pone al jugador en la posicion nueva
	sub $t0, $t1, $s0
	j movimiento
	
llenar:
	li $t0, 0 #contador externo e indice de filas 
	li $t1, SIZE
	li $t3, 0 #contador del loop interno e indice de columnas
	li $t4, SIZE
	li $t5, SIZE
	subi $t5, $t5, 1
	li $t7, BLOQUE
	#matriz=laberinto[$t0][$t3]
	fill_loop:
		li $t3, 0
		floopinterno: 
			mul $t2, $t0, $t1  #t2= indice de fila * tam de columnas
			add $t2, $t2, $t3 #t2=t2+ indice de columna
			mul $t2, $t2, 4   #t2=t2*4 4 es por el tam ya que estamos usando int
			add $t2, $t2, $s0 #le suma la direccion de memoria de la matriz
			sw $t6, ($t2)
			
			beq $t0, $zero, fillzero
			beq $t3, $zero, fillzero
			beq $t0, $t5, fillzero
			beq $t3, $t5, fillzero
			j fillout
			fillzero:
			sw $t7, ($t2)
			
			fillout:
			addi $t3, $t3, 1 #avanza en el iterador del loop interno
			
			
		bgt $t4, $t3 floopinterno
		addi $t0, $t0, 1 #avanza en el iterador del loop principal
		bgt $t1, $t0 fill_loop
		
		li $t7, 0xefb810
		li $t2, 900
		add $t2, $t2, $s0 
		sw $t7, ($t2)#coloca la llave
		
		#en esta seccion se ponen los bloques que van dentro de la mina
		li $t3, BLOQUE 
		li $t2, 88
		add $t2, $t2, $s0
		sw $t3, ($t2)
		addi $t2, $t2, 48
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 24
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 24
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 20
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 12
		sw $t3, ($t2)
		addi $t2, $t2, 20
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 24
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 28
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 12
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 20
		sw $t3, ($t2)
		addi $t2, $t2, 24
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 20
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 20 #564
		sw $t3, ($t2)
		addi $t2, $t2, 16
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 16
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 28
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 20
		sw $t3, ($t2)
		addi $t2, $t2, 28
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 8 #756
		sw $t3, ($t2)
		addi $t2, $t2, 20
		sw $t3, ($t2)
		addi $t2, $t2, 28
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 16
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 8
		sw $t3, ($t2)
		addi $t2, $t2, 4
		sw $t3, ($t2)
		addi $t2, $t2, 24
		sw $t3, ($t2)
		addi $t2, $t2, 28
		sw $t3, ($t2)
		li $t7, 0x0ff0080 #color del personaje
		li $t2, 68
		add $t2, $t2, $s0 
		sw $t7, ($t2)#coloca al jugador en la posicion inicial
	jr $ra



