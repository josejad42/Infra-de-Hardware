#codigo que realiza a multiplicacao de dois numeros de no maximo 4 digitos
#para ler os dois numeros digite eles e separe com espaco
#ex: 452 3 => 452*3

#guardando variaveis em registradores
lw x19, carac
lw x18, blank
lw x17, um

#funcao main que chama todas as funcoes
main:
	jal x2, read
	add x14, x14, x25
	sub x25, x25, x25
	jal x2, read
	add x15, x15, x25
	add x3, x3, x14
	add x4, x4, x15
	jal x1, multpli
	jal x1, div
	halt

#funcao para ler os numeros de no maximo 4 digitos
read:
	sub x20, x20, x20
	sub x21, x21, x21
	sub x22, x22, x22
	sub x23, x23, x23
	lb x20, 1025(x0)
	beq x20, x18, read
	lb x21, 1025(x0)
	beq x21, x18, mil
	lb x22, 1025(x0)
	beq x22, x18, mil
	lb x23, 1025(x0)
	beq x23, x18, mil

#essas funcoes salvam os numeros digitados no teclado e juntam eles em um so registrador
#funcao para verificar se o numero digitado tem 4 algarismos
mil:
	beq x23, x18, spa1
	beq x23, x0, cent
	sub x20, x20, x19
	add x3, x3, x20
	addi x4, x4, 1000
	jal x1, multpli
	add x25, x25, x5
	sub x3, x3, x3
	sub x4, x4, x4
	sub x21, x21, x19
	add x3, x3, x21
	addi x4, x4, 100
	jal x1, multpli
	add x25, x25, x5
	sub x22, x22, x19
	sub x3, x3, x3
	add x3, x3, x22
	sub x4, x4, x4
	addi x4, x4, 10
	jal x1, multpli
	add x25, x25, x5
	sub x23, x23, x19
	add x25, x25, x23
	sub x3, x3, x3
	sub x4, x4, x4
	jalr x0, 0(x2)
	
#funcao para verificar se o numero tem 3 algarismos
cent:
	beq x22, x18, spa2
	beq x22, x0, dez
	sub x20, x20, x19
	add x3, x3, x20
	addi x4, x4, 100
	jal x1, multpli
	add x25, x25, x5
	sub x21, x21, x19
	sub x3, x3, x3
	add x3, x3, x21
	sub x4, x4, x4
	addi x4, x4, 10
	jal x1, multpli
	add x25, x25, x5
	sub x22, x22, x19
	add x25, x25, x22
	sub x3, x3, x3
	sub x4, x4, x4
	jalr x0, 0(x2)

#funcao para verificar se o numero tem 2 algarismos
dez:
	beq x21, x18, spa3
	beq x21, x0, uni
	sub x20, x20, x19
	add x3, x3, x20
	addi x4, x4, 10
	jal x1, multpli
	add x25, x25, x5
	sub x21, x21, x19
	add x25, x25, x21
	sub x3, x3, x3
	sub x4, x4, x4
	jalr x0, 0(x2)

#funcao para verificar se o numero tem 1 algarismo
uni:
	beq x20, x0, zero
	sub x20, x20, x19
	add x25, x25, x20
	jalr x0, 0(x2)

#funcao para verificar se o numero eh zero
zero:
	add x25, x25, x0
	jalr x0, 0(x2)

#funcoes para identificar espacos
spa1:
	sub x23, x23, x23
	jal x0, mil
spa2:
	sub x22, x22, x22
	jal x0, cent
spa3:
	sub x21, x21, x21
	jal x0, dez

#funcao que multiplica 2 numeros salvos em registradores	
multpli:
	sub x5, x5, x5
	addi x10, x0, 16
	addi x7, x0, 1
	add x8, x0, x0

	jal x0, exp

	loop:
		and x9, x4, x7
		beq x9, x7, mult
	end:
		addi x8, x8, 1
		slli x7, x7, 1
		beq x0, x0, exp
	mult:
		sll x11, x3, x8
		add x5, x5, x11
		beq x0, x0, end
	exp:
		blt x8, x10, loop
		jalr x0, 0(x1)

#funcao para separar o resultado da multiplicacao em varios registradores
#o maior numero tem 8 algarismos, entao reservei 8 registradores para separar o resultado da multiplcacao
div:
	sub x20, x20, x20
	sub x21, x21, x21
	sub x22, x22, x22
	sub x23, x23, x23
	sub x24, x24, x24
	sub x25, x25, x25
	sub x26, x26, x26
	sub x10, x10, x10
	sub x11, x11, x11
	sub x6, x6, x6
	sub x7, x7, x7
	add x6, x6, x5	
	
	comeco:
		sub x6, x6, x6
		sub x7, x7, x7
		lw x10, dez7
		blt	x5, x10, vese6
		add x6, x6, x5
	casa7:
		sub x5, x5, x10
		blt x5, x10, saida7
		jal x0, casa7
	saida7:
		sub x6, x6, x5
		loopc7:
			sub x6, x6, x10
			addi x7, x7, 1
			bge x6, x17, loopc7
		add x20, x20, x7
		jal x0, comeco
	vese6:
		lw x10, dez6
		blt	x5, x10, vese5
		add x6, x6, x5
	casa6:
		sub x5, x5, x10
		blt x5, x10, saida6
		jal x0, casa6
	saida6:
		sub x6, x6, x5
		loopc6:
			sub x6, x6, x10
			addi x7, x7, 1
			bge x6, x17, loopc6
		add x21, x21, x7
		jal x0, comeco
	vese5:
		lw x10, dez5
		blt	x5, x10, vese4
		add x6, x6, x5
	casa5:
		sub x5, x5, x10
		blt x5, x10, saida5
		jal x0, casa5
	saida5:
		sub x6, x6, x5
		loopc5:
			sub x6, x6, x10
			addi x7, x7, 1
			bge x6, x17, loopc5
		add x22, x22, x7
		jal x0, comeco
	vese4:
		lw x10, dez4
		blt	x5, x10, vese3
		add x6, x6, x5
	casa4:
		sub x5, x5, x10
		blt x5, x10, saida4
		jal x0, casa4
	saida4:
		sub x6, x6, x5
		loopc4:
			sub x6, x6, x10
			addi x7, x7, 1
			bge x6, x17, loopc4
		add x23, x23, x7
		jal x0, comeco
	vese3:
		lw x10, dez3
		blt	x5, x10, vese2
		add x6, x6, x5
	casa3:
		sub x5, x5, x10
		blt x5, x10, saida3
		jal x0, casa3
	saida3:
		sub x6, x6, x5
		loopc3:
			sub x6, x6, x10
			addi x7, x7, 1
			bge x6, x17, loopc3
		add x24, x24, x7
		jal x0, comeco
	vese2:
		lw x10, dez2
		blt x5, x10, vese1
		add x6, x6, x5
	casa2:
		sub x5, x5, x10
		blt x5, x10, saida2
		jal x0, casa2
	saida2:
		sub x6, x6, x5
		loopc2:
			sub x6, x6, x10
			addi x7, x7, 1
			bge x6, x17, loopc2
		add x25, x25, x7
		jal x0, comeco
	vese1:
		lw x10, dez1
		blt x5, x10, direto
		add x6, x6, x5
	casa1:
		sub x5, x5, x10
		blt x5, x10, saida1
		jal x0, casa1
	saida1:
		sub x6, x6, x5
		loopc1:
			sub x6, x6, x10
			addi x7, x7, 1
			bge x6, x17, loopc1
		add x26, x26, x7
		jal x0, comeco
	direto:
		add x27, x27, x5
		jal x0, print

#funcao que printa o numero algarismo por algarismo(dando o efeito que eh um numero so)
#tem que somar 48 em cada registrador pra printar o numero em ascii
	print:
		blt x20, x17, tem6
		addi x20, x20, 48
		addi x21, x21, 48
		addi x22, x22, 48
		addi x23, x23, 48
		addi x24, x24, 48
		addi x25, x25, 48
		addi x26, x26, 48
		addi x27, x27, 48		
		sb x20, 1024(x0)
		sb x21, 1024(x0)
 		sb x22, 1024(x0)
		sb x23, 1024(x0)
		sb x24, 1024(x0)	
		sb x25, 1024(x0)
		sb x26, 1024(x0)
		sb x27, 1024(x0)
		jalr x0, 0(x1)

		tem6:
			blt x21, x17, tem5
			addi x21, x21, 48
			addi x22, x22, 48
			addi x23, x23, 48
			addi x24, x24, 48
			addi x25, x25, 48
			addi x26, x26, 48
			addi x27, x27, 48		
			sb x21, 1024(x0)
 			sb x22, 1024(x0)
			sb x23, 1024(x0)
			sb x24, 1024(x0)	
			sb x25, 1024(x0)
			sb x26, 1024(x0)
			sb x27, 1024(x0)
			jalr x0, 0(x1)
 
		tem5:
			blt x22, x17, tem4
			addi x22, x22, 48
			addi x23, x23, 48
			addi x24, x24, 48
			addi x25, x25, 48
			addi x26, x26, 48
			addi x27, x27, 48		
 			sb x22, 1024(x0)
			sb x23, 1024(x0)
			sb x24, 1024(x0)	
			sb x25, 1024(x0)
			sb x26, 1024(x0)
			sb x27, 1024(x0)
			jalr x0, 0(x1)
		tem4:
			blt x23, x17, tem3
			addi x23, x23, 48
			addi x24, x24, 48
			addi x25, x25, 48
			addi x26, x26, 48
			addi x27, x27, 48		
			sb x23, 1024(x0)
			sb x24, 1024(x0)	
			sb x25, 1024(x0)
			sb x26, 1024(x0)
			sb x27, 1024(x0)
			jalr x0, 0(x1)
		tem3:
			blt x24, x17, tem2
			addi x24, x24, 48
			addi x25, x25, 48
			addi x26, x26, 48
			addi x27, x27, 48
			sb x24, 1024(x0)	
			sb x25, 1024(x0)
			sb x26, 1024(x0)
			sb x27, 1024(x0)
			jalr x0, 0(x1)
		tem2:
			blt x25, x17, tem1
			addi x25, x25, 48
			addi x26, x26, 48
			addi x27, x27, 48	
			sb x25, 1024(x0)
			sb x26, 1024(x0)
			sb x27, 1024(x0)
			jalr x0, 0(x1)
		tem1:
			blt x26, x17, tem0
			addi x26, x26, 48
			addi x27, x27, 48	
			sb x26, 1024(x0)
			sb x27, 1024(x0)
			jalr x0, 0(x1)
		tem0:
			addi x27, x27, 48
			sb x27, 1024(x0)
			jalr x0, 0(x1)

#declaracao das variaveis com seus valores
dez7: .word 10000000
dez6: .word 1000000
dez5: .word 100000
dez4: .word 10000
dez3: .word 1000
dez2: .word 100
dez1: .word 10
carac: .word 48
blank: .word 32
sete: .word 7
seis: .word 6
cinco:	.word 5
quatro: .word 4
tres: .word 3
dois: .word 2
um: .word 1
zero: .word 0
