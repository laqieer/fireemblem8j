	.syntax unified
	.section .text.sub_8042E2C, "ax", %progbits
@ sub_8042E2C @ JP 0x08042E2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042E2C
	.thumb_func
sub_8042E2C:
	ldr r1, _08042E34 @ =0x0203DA20
	movs r0, #0xff
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_08042E34: .4byte 0x0203DA20

