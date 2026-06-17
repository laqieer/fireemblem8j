	.syntax unified
	.section .text.sub_80485EC, "ax", %progbits
@ sub_80485EC @ JP 0x080485EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80485EC
	.thumb_func
sub_80485EC:
	ldr r0, _080485FC @ =0x085D31E8
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	bx lr
	.align 2, 0
_080485FC: .4byte 0x085D31E8

