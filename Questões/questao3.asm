#codigo que recebe uma palavra no teclado e retorna a quantidade de consoantes na saida de video

#guardando a variavel em um registrador
lw x17, dez

#loop que verifica le letra por letra e identifica se é uma vogal, se for retorna para o loop e le a proxima letra
loop:
	add x10, x10, x0
	lb x10, 1025(x0) 
	
	beq x10, x0, end
	
	lw x13, A
	beq x10, x13, loop
	lw x13, E
	beq x10, x13, loop
	lw x13, I
	beq x10, x13, loop
	lw x13, O
	beq x10, x13, loop
	lw x13, U
	beq x10, x13, loop
	lw x13, a
	beq x10, x13, loop
	lw x13, e
	beq x10, x13, loop
	lw x13, i
	beq x10, x13, loop
	lw x13, o
	beq x10, x13, loop
	lw x13, u
	beq x10, x13, loop
	
	jal x0, soma

#se o programa nao ler nada na funcao de leitura, pula para aqui
#se o numero de consoantes for menor que 10 ele soma 48 e printa pra sair o numero em ascii	
end:
	bge x5, x17, div

	addi x5, x5, 48
	sb x5, 1024(x0)

	halt

#se nao for uma vogal soma um no contador
soma:
	addi x5, x5, 1
	jal x0, loop

#se o numero for maior que 9 ele vem pra ca e divide o numero em dois registradores diferentes
#e printa os dois registradores pra dar o efeito que eh um print so
div:
	sub x5, x5, x17
		
	addi x6, x6, 1
		
	bge x5, x17, div
	
	addi x5, x5, 48
	addi x6, x6, 48
	sb x6, 1024(x0)
	sb x5, 1024(x0)

	halt

#declaracao das variaveis
dez: .word 10
A: .word 65
E: .word 69
I: .word 73
O: .word 79
U: .word 85
a: .word 97
e: .word 101
i: .word 105
o: .word 111
u: .word 117
