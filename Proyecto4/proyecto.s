/*
Luis Esturban #17256
Antonio Reyes #17273
*/

.text
.align 2
.global main

main:
	bl GetGpioAddress 
	
	@GPIO Puerto 5
	mov r0, #5
	mov r1, #1
	bl SetGpioFunction

	@GPIO Puerto 6
	mov r0, #6
	mov r1, #1
	bl SetGpioFunction

	@GPIO Puerto 13
	mov r0, #13
	mov r1, #1
	bl SetGpioFunction

	@GPIP Puerto 12
	mov r0, #12
	mov r1, #1
	bl SetGpioFunction
	
	@GPIO Puerto 21  boton 1
	mov r0,#21
	mov r1,#0
	bl SetGpioFunction

	@GPIO Puerto 20  boton 2
	mov r0,#20
	mov r1,#0
	bl SetGpioFunction

	@GPIO Puerto 16 boton 3
	mov r0,#16
	mov r1,#0
	bl SetGpioFunction

	@GPIO Puerto 23 boton 4
	mov r0,#23
	mov r1,#0
	bl SetGpioFunction

	@GPIO Puerto 24 boton 5
	mov r0,#24
	mov r1,#0
	bl SetGpioFunction

	
	
	ldr r0, =preguntaInicial
	bl puts
	ldr r0, =formatoInicial
	ldr r1, =opcionInicial
	bl scanf
	
	ldr r6, =opcionInicial
	ldr r7, [r6]
	
	cmp r7, #1
	beq pantalla
	
	cmp r7, #2
	beq pushB


	
pushB:
	@BOTON1 *************************************
	@Mueve los datos del boton al contador
	mov r0,#21
	
	@Verifica Presion 
	bl GetGpio
	
	@Toma el valor de retorno
	mov r5, r0
	
	@Enciende la led de la cual es el turno
	teq r5,#0
	
	bne loopV1BTN
	

	@BOTON2**************************************

	@Mueve los datos el boton
	mov r0, #20

	@Verifica Presion
	bl GetGpio

	@Toma el valor de retorno
	mov r5, r0

	@Enciende la led de la cual es el turno
	teq r5, #0

	bne loopV2BTN
	


	@BOTON3**************************************

	@Mueve los datos el boton
	mov r0, #16

	@Verifica Presion
	bl GetGpio

	@Toma el valor de retorno
	mov r5, r0

	@Enciende la led de la cual es el turno
	teq r5, #0

	bne loopInversoBTN

	
	@BOTON4**************************************
	@Mueve los datos el boton
	mov r0, #23

	@Verifica Presion
	bl GetGpio

	@Toma el valor de retorno
	mov r5, r0

	@Enciende la led de la cual es el turno
	teq r5, #0

	bne loopInverso2BTN

	
	@BOTON5**************************************
	
	@Mueve los datos el boton
	mov r0, #24

	@Verifica Presion
	bl GetGpio

	@Toma el valor de retorno
	mov r5, r0

	@Enciende la led de la cual es el turno
	teq r5, #0

	bne loopTBTN
	


	b pushB
	
	
pantalla:
	ldr r0, =pregunta
	bl puts
	ldr r0, =formatoNUM
	ldr r1, =opcion
	bl scanf
	
	ldr r4,=opcion
	ldr r5,[r4] 
	
	cmp r5, #1
	ldreq r0, =regresar
	bleq puts
	beq loopV1
	
	
	cmp r5, #2
	ldreq r0, =regresar
	bleq puts
	beq loopV2

	cmp r5, #3
	ldreq r0, =regresar
	bleq puts
	beq loopInverso

	cmp r5, #4
	ldreq r0, =regresar
	bleq puts
	beq loopInverso2
	
	cmp r5, #5
	ldreq r0, =regresar
	bleq puts
	beq loopT

loopV1:
@*************************************************************************
@INDEX 1
	
	@Mueve los datos del boton al contador
	mov r0,#21
	
	@Verifica Presion 
	bl GetGpio
	
	@Toma el valor de retorno
	mov r5, r0
	
	
	teq r5,#0
	
	bne main             @Si se presiona el boton se va a regresar al menu de inicio

	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait


@*************************************************************************
@INDEX 2

	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait


@*************************************************************************
@INDEX 3
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait


@*************************************************************************
@INDEX 4
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Apagar 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait

	b loopV1
	
@ETIQUETA PARA VELOCIDAD 2
@ETIQUETA PARA VELOCIDAD 2
@ETIQUETA PARA VELOCIDAD 2
@ETIQUETA PARA VELOCIDAD 2
@ETIQUETA PARA VELOCIDAD 2
@ETIQUETA PARA VELOCIDAD 2
@ETIQUETA PARA VELOCIDAD 2

loopV2:
@*************************************************************************
@INDEX 1
	
	@Mueve los datos del boton al contador
	mov r0,#21
	
	@Verifica Presion 
	bl GetGpio
	
	@Toma el valor de retorno
	mov r5, r0
	
	
	teq r5,#0
	
	bne main             @Si se presiona el boton se va a regresar al menu de inicio



	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait
	bl wait
	bl wait
	bl wait


@*************************************************************************
@INDEX 2

	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait
	bl wait
	bl wait
	bl wait


@*************************************************************************
@INDEX 3
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait
	bl wait
	bl wait
	bl wait



@*************************************************************************
@INDEX 4
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Apagar 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait
	bl wait
	bl wait
	bl wait

	b loopV2

@*****************************************************************************
@INVERSO
@INVERSO
@INVERSO
@INVERSO
@INVERSO
@INVERSO
@INVERSO
@INVERSO
@INVERSO

loopInverso:
@*************************************************************************
@INDEX 4

	@Mueve los datos del boton al contador
	mov r0,#21
	
	@Verifica Presion 
	bl GetGpio
	
	@Toma el valor de retorno
	mov r5, r0
	
	
	teq r5,#0
	
	bne main             @Si se presiona el boton se va a regresar al menu de inicio


	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Apagar 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait

@INDEX 3
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait

@INDEX 2

	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait

@INDEX 1
	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait


	b loopInverso

@*****************************************************************************
@INVERSO
@INVERSO
@INVERSO
@INVERSO
@INVERSO
@INVERSO
@INVERSO
@INVERSO
@INVERSO

loopInverso2:
@*************************************************************************
@INDEX 4

	@Mueve los datos del boton al contador
	mov r0,#21
	
	@Verifica Presion 
	bl GetGpio
	
	@Toma el valor de retorno
	mov r5, r0
	
	
	teq r5,#0
	
	bne main             @Si se presiona el boton se va a regresar al menu de inicio


	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Apagar 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait
	bl wait
	bl wait
	

@INDEX 3
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait
	bl wait
	bl wait
	

@INDEX 2

	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait
	bl wait
	bl wait
	

@INDEX 1
	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait
	bl wait
	bl wait
	


	b loopInverso2


loopT:
@*************************************************************************
@INDEX 1
	
	@Mueve los datos del boton al contador
	mov r0,#21
	
	@Verifica Presion 
	bl GetGpio
	
	@Toma el valor de retorno
	mov r5, r0
	
	
	teq r5,#0
	
	bne main             @Si se presiona el boton se va a regresar al menu de inicio

	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait
	bl wait
	bl wait


@*************************************************************************
@INDEX 2

	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait


@*************************************************************************
@INDEX 3
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait
	bl wait
	bl wait


@*************************************************************************
@INDEX 4
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Apagar 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait

	b loopT


@****************************************************
@LOOP CON BOTON
@LOOP CON BOTON
@LOOP CON BOTON
@LOOP CON BOTON
@LOOP CON BOTON
@LOOP CON BOTON
@LOOP CON BOTON

loopV1BTN:
@*************************************************************************
@INDEX 1
	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait
	/*
	bl wait
	bl wait
	bl wait
	bl wait
	bl wait
	*/

@*************************************************************************
@INDEX 2

	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait
/*
	bl wait
	bl wait
	bl wait
	bl wait
	bl wait
*/

@*************************************************************************
@INDEX 3
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait
/*
	bl wait
	bl wait
	bl wait
	bl wait
	bl wait
*/

@*************************************************************************
@INDEX 4
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Apagar 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait
/*
	bl wait
	bl wait
	bl wait
	bl wait
	bl wait
*/
	b pushB


loopV2BTN:
@*************************************************************************
@INDEX 1
	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait
	bl wait
	bl wait
	bl wait


@*************************************************************************
@INDEX 2

	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait
	bl wait
	bl wait
	bl wait


@*************************************************************************
@INDEX 3
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait
	bl wait
	bl wait
	bl wait



@*************************************************************************
@INDEX 4
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Apagar 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait
	bl wait
	bl wait
	bl wait

	b pushB


loopInversoBTN:
@*************************************************************************
@INDEX 4
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Apagar 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait

@INDEX 3
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait

@INDEX 2

	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait

@INDEX 1
	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait

	b pushB

loopInverso2BTN:
@*************************************************************************
@INDEX 4

	@Mueve los datos del boton al contador
	mov r0,#21
	
	@Verifica Presion 
	bl GetGpio
	
	@Toma el valor de retorno
	mov r5, r0
	
	
	teq r5,#0
	
	bne main             @Si se presiona el boton se va a regresar al menu de inicio


	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Apagar 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait
	bl wait
	bl wait
	

@INDEX 3
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait
	bl wait
	bl wait
	

@INDEX 2

	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait
	bl wait
	bl wait
	

@INDEX 1
	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait
	bl wait
	bl wait
	

	b pushB

loopTBTN:
@*************************************************************************
@INDEX 1
	
	@Mueve los datos del boton al contador
	mov r0,#21
	
	@Verifica Presion 
	bl GetGpio
	
	@Toma el valor de retorno
	mov r5, r0
	
	
	teq r5,#0
	
	bne main             @Si se presiona el boton se va a regresar al menu de inicio

	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait
	bl wait
	bl wait


@*************************************************************************
@INDEX 2

	@GPIO Encender 5 (LED 1)
	mov r0,#5
	mov r1,#1
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 12 (LED 3)
	mov r0,#12
	mov r1,#0
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait


@*************************************************************************
@INDEX 3
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Encender 6 (LED 2)
	mov r0,#6
	mov r1,#1
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Apaga 13 (LED 4)
	mov r0,#13
	mov r1,#0
	bl SetGpio

	bl wait
	bl wait
	bl wait


@*************************************************************************
@INDEX 4
	@GPIO Apagar 5 (LED 1)
	mov r0,#5
	mov r1,#0
	bl SetGpio

	@GPIO Apagar 6 (LED 2)
	mov r0,#6
	mov r1,#0
	bl SetGpio

	@GPIO Encender 12 (LED 3)
	mov r0,#12
	mov r1,#1
	bl SetGpio

	@GPIO Encender 13 (LED 4)
	mov r0,#13
	mov r1,#1
	bl SetGpio

	bl wait

	b pushB


esperaPantalla:
	ldr r0, =formatoRegreso
	ldr r1, =opcionRegreso
	bl scanf
	ldr r8, =opcionRegreso
	ldr r9, [r8]

	@ldr r0, =formatoInicial
	@ldr r1, =opcionInicial
	@bl scanf
	
	cmp r9, #1
	beq main

	bne loopV1

@ brief pause routine
wait:
 mov r0, #0xF00000 @ big number


sleepLoop:
 subs r0,#1
 bne sleepLoop @ loop delay
 mov pc,lr


.data
.align 2
.global myloc
myloc: .word 0

preguntaInicial:
	.asciz "Desea utilizar consola(1) o un push button(2)"
	
opcionInicial:
	.word 0

pregunta: @@eleccion de fila donde colocar la "ficha"
	.asciz "Elija: (1),(2),(3),(4),(5)"
	
formatoInicial:
	.asciz "%d"

formatoNUM:
	.asciz "%d"
	
	
opcion:
	.word 0

regresar:
	.asciz "Presione BOTON1 para detener el Stepper y regresar al menu principal"

formatoRegreso:
	.asciz "%d"

opcionRegreso:
	.word 8

 .end
