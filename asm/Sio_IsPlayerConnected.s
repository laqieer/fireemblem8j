	.syntax unified
	.section .text.Sio_IsPlayerConnected, "ax", %progbits
@ Sio_IsPlayerConnected @ JP 0x08042114 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Sio_IsPlayerConnected
	.thumb_func
Sio_IsPlayerConnected:
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08042130 @ =0x085D31E8
	ldr r1, [r1]
	ldrb r1, [r1, #9]
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _08042134
	movs r0, #0
	b _08042136
	.align 2, 0
_08042130: .4byte 0x085D31E8
_08042134:
	movs r0, #1
_08042136:
	pop {r1}
	bx r1
	.align 2, 0

