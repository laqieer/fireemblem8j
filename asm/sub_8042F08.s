	.syntax unified
	.section .text.sub_8042F08, "ax", %progbits
@ sub_8042F08 @ JP 0x08042F08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042F08
	.thumb_func
sub_8042F08:
	ldr r0, _08042F18 @ =0x085D31E8
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	bx lr
	.align 2, 0
_08042F18: .4byte 0x085D31E8

