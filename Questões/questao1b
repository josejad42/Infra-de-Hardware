#os numeros digitados devem ser menores do que 100 e ter duas casas 
#exemplo: ao invés de 2 digite 02

jal x1, carrega

loop:
lb x14, 1025(x0) #le caractere do teclado (dezena)
lb x15, 1025(x0) #le caractere do teclado (unidade)
lb x27, 1025(x0) #le caractere do teclado (space ou vazio)
jal x1, dezena

#computa a dezena
dezena:
	lw x8, zero
    beq x14, x8, mul0
    lw x8, um
	beq x14, x8, mul1
    lw x8, dois
	beq x14, x8, mul2
	lw x8, tres
	beq x14, x8, mul3
	lw x8, quatro
	beq x14, x8, mul4
 	lw x8, cinco
	beq x14, x8, mul5
 	lw x8, seis
	beq x14, x8, mul6
	lw x8, sete
	beq x14, x8, mul7
 	lw x8, oito
	beq x14, x8, mul8
 	lw x8, nove
	beq x14, x8, mul9
    jal x1, unidade 
	
	mul0:
    		addi x5, x0, 0
		jal x11, unidade
	mul1:
		addi x5, x0, 10
		jal x11, unidade
	mul2:
		addi x5, x0, 20
		jal x11, unidade
	mul3:
		addi x5, x0, 30
		jal x11, unidade
	mul4:
		addi x5, x0, 40
		jal x11, unidade
	mul5:
		addi x5, x0, 50
		jal x11, unidade
	mul6:
		addi x5, x0, 60
		jal x11, unidade
	mul7:
    		addi x5, x0, 70
        jal x11, unidade
	mul8:
		addi x5, x0, 80
		jal x11, unidade
	mul9:
		addi x5, x0, 90
		jal x11, unidade

#soma valor de unidade com valor da dezena
unidade:
    xor x31, x31, x31
    addi x15, x15, -48 
    add x31, x15, x5 #soma o resultado da multlipicacao de x3 por x4 que está em x5 com o valor da unidade salvo em x15
    jalr x0, 0(x12)


#carrega a, b, c nos registradores
carrega:
jal x12, loop
xor x5, x5, x5
add x5, x5, x31
jal x12, loop
xor x6, x6, x6
add x6, x6, x31
jal x12, loop
xor x7, x7, x7
add x7, x7, x31

condicao1:
addi x16, x0, 48 #garante como x16 (nosso x) começa zerado
#verifica se a >= 0
bge x5, x0, condicao2
jal x11, fim

condicao2:
lw x28, sessenta_dois
#verifica b<62
blt x6, x28, condicao3a
#verifica b==62
beq x6, x28, condicao3a
jal x11, fim

#verifica c >= 15 (o necessario é ver se c>15, por isso a parte B)
condicao3a:
lw x29, quinze
bge x7, x29, condicao3b
jal x11, fim

#verifica se c nao é igual a 15
condicao3b:
beq x7, x29, fim
jal x11, change

# muda x16 (nosso x) para 1 se todas as condicoes anteriores foram satisfeitas
change:
addi x16, x16, 1
jal x11, fim

fim:
sw x16, 1024(x0)
halt

zero: .word 48
um: .word 49
dois: .word 50
tres: .word 51
quatro: .word 52
cinco: .word 53
seis: .word 54
sete: .word 55
oito: .word 56
nove: .word 57
sessenta_dois: .word 62
quinze: .word 15
tres: .word 3
space: .word 32
