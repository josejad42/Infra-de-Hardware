#a, b, c estao salvos em x5, x6, x7 respectivamente
#x esta salvo em x16

condicao1:
lw x5, a #carrega a, b, c nos registradores
lw x6, b
lw x7, c
#garante como x16 (nosso x) começa zerado
xor x16, x16, x16
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
halt

#os testes estao comentados abaixo

#teste1
#a: .word 0
#b: .word 62
#c: .word 16
#resultado x = 1

#teste2
#a: .word 0
#b: .word 69
#c: .word 16
#resultado x = 0

#teste3
#a: .word 67
#b: .word 62
#c: .word 15
#resultado x = 0

#teste4
#a: .word 67
#b: .word 62
#c: .word 67
#resultado x = 1

#teste5
#a: .word 42
#b: .word 13
#c: .word 69
#resultado x = 1

a: .word 0
b: .word 62
c: .word 16
sessenta_dois: .word 62
quinze: .word 15
tres: .word 3

