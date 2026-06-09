	.syntax unified
	.section .text.Config_SetSourceFromPrep, "ax", %progbits
@ Config_SetSourceFromPrep @ JP 0x080B70C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Config_SetSourceFromPrep
	.thumb_func
Config_SetSourceFromPrep:
	ldr r0, _080B70D4 @ =0x08AAF6D8
	ldr r1, [r0]
	adds r1, #0x37
	ldrb r0, [r1]
	movs r2, #1
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_080B70D4: .4byte 0x08AAF6D8

