# VALORES UTILIZADOS EM CADA LED
#Vermelho esquerdo => 3
#Amarelo esquerdo => 5
#Verde esquerdo => 6

#Vermelho direito => 9
#Amarelo direito => 10
#Verde direito => 11 
start:
	sb x10, 1030(x0)
	lh x10, 1031(x0)
	sh x10, 1024(x0) 		#Pegando o valor analógico do sensor de temperatura em A0 e colocando em x10

	addi x14, x0, 310
	blt x10, x14, opcao1 		#Se x10 < 16, pule para opcao1
	
	addi x14, x0, 410
	blt x10, x14, opcao2 		#Se x10 < 21 (e x10 > 15 já que nunca chegaria aqui se fosse), pule para opcao1

	addi x14, x0, 520
	blt x10, x14, opcao3 		#Se x10 < 26 (e x10 > 20 já que nunca chegaria aqui se fosse), pule para opcao3

	addi x14, x0, 620 
	blt x10, x14, opcao4 		#Se x10 < 31 (e x10 > 25 já que nunca chegaria aqui se fosse), pule para opcao4

	addi x14, x0, 720
	blt x10, x14, opcao5 		#Se x10 < 36 (e x10 > 30 já que nunca chegaria aqui se fosse), pule para opcao5

	jal x11, opcao6 		#Se x10 > 35 execute esse jump para opcao6

	halt 

#Liga o VERMELHO ESQUERDO e apaga os outros LEDS
opcao1:
	jal x11, apaga_Lyellow
	jal x11, apaga_Lgreen
	jal x11, apaga_Rred
	jal x11, apaga_Ryellow
	jal x11, apaga_Rgreen
	jal x11, acende_Lred
	jal x11, start

#Liga o AMARELO ESQUERDO e apaga os outros LEDS
opcao2:
	jal x11, apaga_Lred
	jal x11, apaga_Lgreen
	jal x11, apaga_Rred
	jal x11, apaga_Ryellow
	jal x11, apaga_Rgreen
	jal x11, acende_Lyellow 
	jal x11, start

#Liga o AMARELO DIREITO e apaga os outros LEDS
opcao3:
	jal x11, apaga_Lred
	jal x11, apaga_Lgreen
	jal x11, apaga_Rred
	jal x11, apaga_Rgreen
	jal x11, apaga_Lyellow 
	jal x11, acende_Ryellow
	jal x11, start
		
#Liga o VERDE ESQUERDO e apaga os outros LEDS
opcao4:
	jal x11, apaga_Lred
	jal x11, apaga_Rred
	jal x11, apaga_Rgreen
	jal x11, apaga_Lyellow 
	jal x11, apaga_Ryellow
	jal x11, acende_Lgreen
	jal x11, start 

#Liga o VERDE DIREITO e apaga os outros LEDS
opcao5:
	jal x11, apaga_Lred
	jal x11, apaga_Rred
	jal x11, apaga_Lgreen
	jal x11, apaga_Lyellow 
	jal x11, apaga_Ryellow
	jal x11, acende_Rgreen
	jal x11, start 

#Liga o VERMELHO DIREITO e apaga os outros LEDS
opcao6:
	jal x11, apaga_Lred
	jal x11, apaga_Lgreen
	jal x11, apaga_Lyellow 
	jal x11, apaga_Ryellow
	jal x11, apaga_Rgreen
	jal x11, acende_Rred 
	jal x11, start

#acende LED VERMELHO ESQUERDO
acende_Lred:
	addi x12, x0, 3
	addi x13, x0, 255
	sb x12, 1033(x0)
	sb x13, 1034(x0)
	jalr x0, 0(x11)  

#apaga LED VERMELHO ESQUERDO	
apaga_Lred:
	addi x12, x0, 3
	addi x13, x0, 0
	sb x12, 1033(x0)
	sb x13, 1034(x0)
	jalr x0, 0(x11) 

#acende LED AMARELO ESQUERDO
acende_Lyellow:
	addi x12, x0, 5
	addi x13, x0, 255
	sb x12, 1033(x0)
	sb x13, 1034(x0)
	jalr x0, 0(x11)  

#apaga LED AMARELO ESQUERDO
apaga_Lyellow:
	addi x12, x0, 5
	addi x13, x0, 0
	sb x12, 1033(x0)
	sb x13, 1034(x0)
	jalr x0, 0(x11)  

#acende LED VERDE ESQUERDO
acende_Lgreen:
	addi x12, x0, 6
	addi x13, x0, 255
	sb x12, 1033(x0)
	sb x13, 1034(x0)
	jalr x0, 0(x11)  

#apaga LED VERDE ESQUERDO
apaga_Lgreen:
	addi x12, x0, 6
	addi x13, x0, 0
	sb x12, 1033(x0)
	sb x13, 1034(x0)
	jalr x0, 0(x11)  

#acende LED VERMELHO DIREITO
acende_Rred:
	addi x12, x0, 9
	addi x13, x0, 255
	sb x12, 1033(x0)
	sb x13, 1034(x0)
	jalr x0, 0(x11)  

#apaga LED VERMELHO DIREITO
apaga_Rred:
	addi x12, x0, 9
	addi x13, x0, 0
	sb x12, 1033(x0)
	sb x13, 1034(x0)
	jalr x0, 0(x11)  

#acende LED AMARELO DIREITO
acende_Ryellow:
	addi x12, x0, 10
	addi x13, x0, 255
	sb x12, 1033(x0)
	sb x13, 1034(x0)
	jalr x0, 0(x11)

#apaga LED AMARELO DIREITO
apaga_Ryellow:
	addi x12, x0, 10
	addi x13, x0, 0
	sb x12, 1033(x0)
	sb x13, 1034(x0)
	jalr x0, 0(x11)

#acende LED VERDE DIREITO
acende_Rgreen:
	addi x12, x0, 11
	addi x13, x0, 255
	sb x12, 1033(x0)
	sb x13, 1034(x0)
	jalr x0, 0(x11)

#apaga LED VERDE DIREITO
apaga_Rgreen:
	addi x12, x0, 11
	addi x13, x0, 0
	sb x12, 1033(x0)
	sb x13, 1034(x0)
	jalr x0, 0(x11)
