	.syntax unified
	.section .text.sub_80DA8E0, "ax", %progbits
@ sub_80DA8E0 @ JP 0x080DA8E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80DA8E0
	.thumb_func
sub_80DA8E0:
	ldr r0, _080DA8E8 @ =0x08BB8A74
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080DA8E8: .4byte 0x08BB8A74

