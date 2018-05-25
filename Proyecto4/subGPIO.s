@ Autor: Luis Esturban y Antonio Reyes
@ Carnet: 17256 y 17273
@ Subrutina pala lab13


.text
.align 2
.global GetGpio
GetGpio:
	push {lr}
	mov r9, r0

	ldr r6, =myloc
 	ldr r0, [r6]		 
	ldr r5,[r0,#0x34]	
	mov r7,#1
	lsl r7,r9
	and r5,r7 		

	mov r0,r5

	pop {lr}
	mov pc, lr

final:
	bl wait
	pop {lr}
	mov pc, lr
