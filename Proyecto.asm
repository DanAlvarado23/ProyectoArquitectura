.data
	laberinto: .space 1024
	.eqv SIZE 16
	.eqv BLOQUE 0x000000 #bloques negros donde este bloqueado 
	.eqv VACIO 0xffffff #bloques blancos donde se pueda pasar
.text 
  main:
    la $s0, laberinto
    li $t6, VACIO
    jal llenar
    #termina el programa
    li $v0, 10
    syscall



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

