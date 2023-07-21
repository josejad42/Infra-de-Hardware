# VALORES UTILIZADOS EM CADA SEGMENTO DO DISPLAY
# a => 2
# b => 3
# c => 4
# d => 5
# e => 6
# f => 7
# g => 8
Zero: .byte 63
One: .byte 6
Two_1: .byte 27
Three_1: .byte 15
Four_1: .byte 38
Five_1: .byte 45
Six: .byte 61
Seven: .byte 7
char0: .byte 48 #ZERO 
Nine_1: .byte 47
LOW: .byte 0
g: .byte 1


get_word:
	lb x18, 8(x0)

	lb x13, 1025(x0)
	lb x14, 1025(x0)
	lb x15, 1025(x0)
	lb x16, 1025(x0)

	bne x13, x18, compare4		#se o 4º bit == 1
	bne x14, x18, compare3		#Ou se o 3º bit == 1
	bne x15, x18, compare2		#Ou se o 2º bit == 1
	bne x16, x18, display_One	#Ou se o 1º bit == 1
	beq x16, x18, display_Zero	#Ou se todos os bits forem 0 -> display 0
	halt
	
#Compare4 sao funcoes para verificar os numeros com o 4º bit igual a 1
compare4:
	bne x16, x18, compare4_2		#se o 1º bit for == 1 pode ser 9 0u limpar a tela
	beq x16, x18, display_Eight 		#se o 1º bit for == 0 -> display 8
	

compare4_2:
	bne x14, x18, clear_Display 		#se o 3º bit for == 1 -> limpe o display
	beq x14, x18, display_Nine		#se o 3º bit for == 0 -> display 9

#Compare3 sao funcoes para verificar os numeros com o 3º bit igual a 1
compare3:
	bne x15, x18, compare3_2 		#se o 2º bit for == 1 pode ser 7 ou 6
	beq x15, x18, compare3_1 		#se o 2º bit for == 0 pode ser 5 ou 4

compare3_2:
	bne x16, x18, display_Seven 		#se o 1º bit for == 1 -> display 7
	beq x16, x18, display_Six		#se o 1º bit for == 0 -> display 6

compare3_1:
	bne x16, x18, display_Five		#se o 1º bit for == 1 -> display 5
	beq x16, x18, display_Four		#se o 1º bit for == 0 -> display 4

#Compare2 sao funcoes para verificar os numeros com o 2º bit igual a 1
compare2:
	bne x16, x18, display_Three #se o 1º bit for == 1 -> display 3
	beq x16, x18, display_Two		#se o 1º bit for == 0 -> display 2


#as proximas funcoes mostram no display de sete segmentos o numero correspondente ao nome da funcao 

display_Zero:
	lb x9, 0(x0)
	lb x10, 10(x0)
	sb x9, 1029(x0)
	sb x10, 1027(x0)
	halt

display_One:
	lb x9, 1(x0)
	lb x10, 10(x0)
	sb x9, 1029(x0)
	sb x10, 1027(x0)
	halt

display_Two:
	lb x9, 2(x0)
	lb x10, 11(x0)
	sb x9, 1029(x0)
	sb x10, 1027(x0)
	halt

display_Three:
	lb x9, 3(x0)
	lb x10, 11(x0)
	sb x9, 1029(x0)
	sb x10, 1027(x0)
	halt

display_Four:
	lb x9, 4(x0)
	lb x10, 11(x0)
	sb x9, 1029(x0)
	sb x10, 1027(x0)
	halt

display_Five:
	lb x9, 5(x0)
	lb x10, 11(x0)
	sb x9, 1029(x0)
	sb x10, 1027(x0)
	halt

display_Six:
	lb x9, 6(x0)
	lb x10, 11(x0)
	sb x9, 1029(x0)
	sb x10, 1027(x0)
	halt

display_Seven:
	lb x9, 7(x0)
	lb x10, 10(x0)
	sb x9, 1029(x0)
	sb x10, 1027(x0)
	halt

display_Eight:
	lb x9, 0(x0)
	lb x10, 11(x0)
	sb x9, 1029(x0)
	sb x10, 1027(x0)
	halt

display_Nine:
	lb x9, 9(x0)
	lb x10, 11(x0)
	sb x9, 1029(x0)
	sb x10, 1027(x0)
	halt

# Limpa o display de sete segmentos
clear_Display:
	lb x9, 10(x0)
	lb x10, 10(x0)
	sb x9, 1029(x0)
	sb x10, 1027(x0)
	halt
