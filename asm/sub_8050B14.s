	.syntax unified
	.section .text.sub_8050B14, "ax", %progbits
@ sub_8050B14 @ JP 0x08050B14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050B14
	.thumb_func
sub_8050B14:
	push {lr}
	ldr r0, _08050B24 @ =0x0203E0F0
	ldr r0, [r0]
	cmp r0, #1
	beq _08050B28
	movs r0, #0
	b _08050B2A
	.align 2, 0
_08050B24: .4byte 0x0203E0F0
_08050B28:
	movs r0, #1
_08050B2A:
	pop {r1}
	bx r1
	.align 2, 0

