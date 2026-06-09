	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.section .text.sub_804D330, "ax", %progbits
@ sub_804D330 @ JP 0x0804D330 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D330
	.thumb_func
sub_804D330:
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	pop {r0}
	bx r0
	.align 2, 0

