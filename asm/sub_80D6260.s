	.syntax unified
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_80D6260, "ax", %progbits
@ sub_80D6260 @ JP 0x080D6260 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D6260
	.thumb_func
sub_80D6260:
	push {lr}
	ldr r2, _080D6270 @ =0x03006470
	ldr r2, [r2]
	bl sub_80D65C4
	pop {r0}
	bx r0
	.align 2, 0
_080D6270: .4byte 0x03006470

