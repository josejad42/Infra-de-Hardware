#os numeros digitados devem ser menores do que 10000 e ter 4 algarismos
#exemplo: ao invés de 2 digite 0002
#a entrada sera no formato:0000 0062 0626
#a, b e c, respectivamente
#a separaçao é feita por space 

#carrega a, b, c nos registradores
carrega:
    jal x12, loop #pula para o loop para ler o número a
    xor x5, x5, x5 
    add x5, x5, x31 #salva o valor de a em x5
    jal x12, loop #pula para o loop para ler o número b
    xor x6, x6, x6
    add x6, x6, x31 #salva o valor de b em x6
    jal x12, loop #pula para o loop para ler o número c
    xor x7, x7, x7
    add x7, x7, x31 #salva o valor de c em x7
    jal x11, condicao1

loop:
    lb x17, 1025(x0) #le caractere do teclado (milhar)
    lb x13, 1025(x0) #le caractere do teclado (centena)
    lb x14, 1025(x0) #le caractere do teclado (dezena)
    lb x15, 1025(x0) #le caractere do teclado (unidade)
    lb x27, 1025(x0) #le caractere do teclado (space ou vazio)
    jal x1, milhar

#computa a unidade de milhar
milhar:
    xor x5, x5, x5 # garante como x5 = 0
	lw x8, zero
    beq x17, x8, mul000
    lw x8, um
	beq x17, x8, mul100
    lw x8, dois
	beq x17, x8, mul200
	lw x8, tres
	beq x17, x8, mul300
	lw x8, quatro
	beq x17, x8, mul400
 	lw x8, cinco
	beq x17, x8, mul500
 	lw x8, seis
	beq x17, x8, mul600
	lw x8, sete
	beq x17, x8, mul700
 	lw x8, oito
	beq x17, x8, mul800
 	lw x8, nove
	beq x17, x8, mul900
    jal x1, centena

#computa a centena
centena:
	lw x8, zero
    beq x13, x8, mul00
    lw x8, um
	beq x13, x8, mul10
    lw x8, dois
	beq x13, x8, mul20
	lw x8, tres
	beq x13, x8, mul30
	lw x8, quatro
	beq x13, x8, mul40
 	lw x8, cinco
	beq x13, x8, mul50
 	lw x8, seis
	beq x13, x8, mul60
	lw x8, sete
	beq x13, x8, mul70
 	lw x8, oito
	beq x13, x8, mul80
 	lw x8, nove
	beq x13, x8, mul90
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
	
#as funcoes do genero mulX retornam o valor da multlipicacao de X por dez
mul1:
	addi x5, x5, 10
	jal x11, unidade
mul2:
	addi x5, x5, 20
	jal x11, unidade
mul3:
	addi x5, x5, 30
	jal x11, unidade
mul4:
	addi x5, x5, 40
	jal x11, unidade
mul5:
	addi x5, x5, 50
	jal x11, unidade
mul6:
	addi x5, x5, 60
	jal x11, unidade
mul7:
        addi x5, x5, 70
        jal x11, unidade
mul8:
	addi x5, x5, 80
	jal x11, unidade
mul9:
	addi x5, x5, 90
	jal x11, unidade
mul0:
        addi x5, x5, 0
	jal x11, unidade
mul10:
	addi x5, x5, 100
	jal x11, dezena
mul20:
	addi x5, x5, 200
	jal x11, dezena
mul30:
	addi x5, x5, 300
	jal x11, dezena
mul40:
	addi x5, x5, 400
	jal x11, dezena
mul50:
	addi x5, x5, 500
	jal x11, dezena
mul60:
	addi x5, x5, 600
	jal x11, dezena
mul70:
        addi x5, x5, 700
        jal x11, dezena
mul80:
	addi x5, x5, 800
	jal x11, dezena
mul90:
	addi x5, x5, 900
	jal x11, dezena
mul00:
        addi x5, x5, 0
	jal x11, dezena
mul100:
	addi x5, x5, 1000
	jal x11, centena
mul200:
	addi x5, x5, 2000
	jal x11, centena
mul300:
	addi x5, x5, 3000
	jal x11, centena
mul400:
	addi x5, x5, 4000
	jal x11, centena
mul500:
	addi x5, x5, 5000
	jal x11, centena
mul600:
	addi x5, x5, 6000
	jal x11, centena
mul700:
       addi x5, x5, 7000
       jal x11, centena
mul800:
	addi x5, x5, 8000
	jal x11, centena
mul900:
	addi x5, x5, 9000
	jal x11, centena
mul000:
        addi x5, x5, 0
	jal x11, centena

#soma valor de unidade com valor da dezena
unidade:
    xor x31, x31, x31
    addi x15, x15, -48 #transforma o valor em ascii em decimal
    add x31, x15, x5 #soma o que está em x5 com o valor da unidade salvo em x15
    jalr x0, 0(x12)

condicao1:
    addi x16, x0, 48 #transforma x em 0 em ascii
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
    addi x16, x16, 1 #transforma x em 1 em ascii
    jal x11, fim

fim:
    sw x16, 1024(x0) #printa o valor de x
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
space: .word 32
