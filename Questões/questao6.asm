	add x16,x0,x0
	add x15,x0,x0

loop:
	add x16,x15,x16
	lb x10, 1025(x0) 
	beq x10,x0,logic
	lw x12, n1
	sub x9,x10,x12

	addi x15,x0,1
	add x6,x0,x0
	jal x0, fat

fat:
	beq x6,x9,loop
	add x7,x15,x0
	addi x8,x6,1
	add x10,x0,x0

mul:
	add x10,x10,x7
	addi x8,x8,-1
	bne x8,x0,mul

fat2:
	add x15,x0,x10
	addi x6,x6,1
	jal x0,fat

logic:

	add x13,x0,x0

	lw x12,milhao
	jal x1,div

	add x13,x0,x0

	lw x12,cemmil
	jal x1,div

	add x13,x0,x0

	lw x12,dezmil
	jal x1,div

	add x13,x0,x0

	lw x12,mil
	jal x1,div

	add x13,x0,x0

	lw x12,cem
	jal x1,div

	add x13,x0,x0

	lw x12,dez
	jal x1,div

	add x13,x0,x0

	lw x12,um
	jal x1,div

	add x13,x0,x0
	sb x13, 1024(x0)

	beq x0,x0,fim

div:
	blt x16,x12,printz
	sub x16,x16,x12
	addi x13,x13,1
	bge x16,x12,div	
	
print:
	addi x13,x13,48
	sb x13, 1024(x0)
	jalr x0,0(x1)#voltar pra algum lugar

printz:
	add x13,x0,x0
	addi x13,x13,48
	sb x13, 1024(x0)
	jalr x0,0(x1)#voltar pra algum lugar

fim:
	halt

n1: .word 48
n2: .word 46080
numero: .word 20
um: .word 1
dez: .word 10
cem: .word 100
mil: .word 1000
dezmil: .word 10000
cemmil: .word 100000
milhao: .word 1000000








