loop:
lb x10, 1025(x0) # le o caractere do teclado 
lw x5, space 
beq x10, x5 , player2 # compara o caractere lido com space, se for igual chama a vez do player 2
lw x5, zero
beq x10, x5 , result # verifica se os inputs chegaram ao fim para computar o resultado
lw x5, A
beq x10, x5 , sum1 # vai comparando o caractere lido com as possibilidades e para cada uma soma a pontuacao correpondente
lw x5, B
beq x10, x5 , sum5
lw x5, C
beq x10, x5 , sum5
lw x5, D
beq x10, x5 , sum3
lw x5, E
beq x10, x5 , sum1
lw x5, F
beq x10, x5 , sum4
lw x5, G
beq x10, x5 , sum3
lw x5, H
beq x10, x5 , sum4
lw x5, I
beq x10, x5 , sum1
lw x5, J
beq x10, x5 , sum6
lw x5, K
beq x10, x5 , sum2
lw x5, L
beq x10, x5 , sum6
lw x5, M
beq x10, x5 , sum5
lw x5, N
beq x10, x5 , sum5
lw x5, O
beq x10, x5 , sum1
lw x5, P
beq x10, x5 , sum5
lw x5, Q
beq x10, x5 , sum9
lw x5, R
beq x10, x5 , sum2
lw x5, S
beq x10, x5 , sum2
lw x5, T
beq x10, x5 , sum3
lw x5, U
beq x10, x5 , sum1
lw x5, V
beq x10, x5 , sum4
lw x5, W
beq x10, x5 , sum4
lw x5, X
beq x10, x5 , sum6
lw x5, Y
beq x10, x5 , sum4
lw x5, Z
beq x10, x5, sum9
jal x11, loop

# as funcoes do genero sumX, somam no registrador a pontuacao resultante a cada caractere
sum1: 
addi x18, x18, 1
jal x11, loop

sum2:
addi x18, x18, 2
jal x11, loop

sum3:
addi x18, x18, 3
jal x11, loop

sum4:
addi x18, x18, 4
jal x11, loop

sum5:
addi x18, x18, 5
jal x11, loop

sum6:
addi x18, x18, 6
jal x11, loop

sum9:
addi x18, x18, 9
jal x11, loop

# joga a pontuacao do player um em um outro registrador para começar a vez do player2
player2: 
add x19, x18, x0
xor x18, x18, x18
jal x11, loop

# computa o ganhador do jogo
result:
beq x18, x19 , empate
bge x18, x19, player2ganhou
jal x11, player1ganhou

player2ganhou:
lw x6, P
sw x6, 1024(x0)
lw x6, L
sw x6, 1024(x0)
lw x6, A
sw x6, 1024(x0)
lw x6, Y
sw x6, 1024(x0)
lw x6, E
sw x6, 1024(x0)
lw x6, R
sw x6, 1024(x0)
lw x6, space
sw x6, 1024(x0)
lw x6, dois
sw x6, 1024(x0)
lw x6, space
sw x6, 1024(x0)
lw x6, W
sw x6, 1024(x0)
lw x6, O
sw x6, 1024(x0)
lw x6, N
sw x6, 1024(x0)
jal x11, placar1

empate:
lw x6, E
sw x6, 1024(x0)
lw x6, M
sw x6, 1024(x0)
lw x6, P
sw x6, 1024(x0)
lw x6, A
sw x6, 1024(x0)
lw x6, T
sw x6, 1024(x0)
lw x6, E
sw x6, 1024(x0)
jal x11, placar1

player1ganhou:
lw x6, P
sw x6, 1024(x0)
lw x6, L
sw x6, 1024(x0)
lw x6, A
sw x6, 1024(x0)
lw x6, Y
sw x6, 1024(x0)
lw x6, E
sw x6, 1024(x0)
lw x6, R
sw x6, 1024(x0)
lw x6, space
sw x6, 1024(x0)
lw x6, um
sw x6, 1024(x0)
lw x6, space
sw x6, 1024(x0)
lw x6, W
sw x6, 1024(x0)
lw x6, O
sw x6, 1024(x0)
lw x6, N
sw x6, 1024(x0)
jal x11, placar1

#Mostra a pontuacao do player um
placar1: 
lw x6, space
sw x6, 1024(x0)
lw x6, S
sw x6, 1024(x0)
lw x6, C
sw x6, 1024(x0)
lw x6, O
sw x6, 1024(x0)
lw x6, R
sw x6, 1024(x0)
lw x6, E
sw x6, 1024(x0)
lw x6, space
sw x6, 1024(x0)
lw x30, one
xor x31, x31, x31
lw x29, dez
bge x19, x29, sDez
jal x11, sUm

# computa a unidade da dezena da pontuacao
sDez: 
sub x19, x19, x29
add x31, x31, x30
bge x19, x29, sDez
lw x6, zero0
add x31, x31, x6
sw x31, 1024(x0)
xor x31, x31, x31
jal x11, sUm

# mostra a unidade da pontuacao
sUm: 
lw x6, zero0
add x19, x19, x6
sw x19, 1024(x0)
beq x23, x30, fim # verifica se as pontuacoes dos dois players foram registradas ou só do player um
lw x6, X
sw x6, 1024(x0)
add x19, x18, x0
add x23, x23, x30
bge x19, x29, sDez # inicia a vez de mostrar o placar do jogador 2
jal x11, sUm

fim:
halt

zero: .word 0
zero0: .word 48
um: .word 49
dois: .word 50
space: .word 32
A: .word 65
B: .word 66
C: .word 67
D: .word 68
E: .word 69
F: .word 70
G: .word 71
H: .word 72
I: .word 73
J: .word 74 
K: .word 75 
L: .word 76 
M: .word 77
N: .word 78
O: .word 79
P: .word 80
Q: .word 81
R: .word 82
S: .word 83
T: .word 84
U: .word 85 
V: .word 86
W: .word 87
X: .word 88
Y: .word 89
Z: .word 90
one: .word 1
dez: .word 10
