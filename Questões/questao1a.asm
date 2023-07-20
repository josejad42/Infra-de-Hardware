#carrega a, b, c nos registradores
condicao1:
lw x5, a
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

a: .word 0
b: .word 62
c: .word 15
sessenta_dois: .word 62
quinze: .word 15
tres: .word 3

