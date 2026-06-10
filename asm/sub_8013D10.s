	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8013BAC, 0x08013BAC + 1
	.section .text.sub_8013D10, "ax", %progbits
@ sub_8013D10 @ JP 0x08013D10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013D10
	.thumb_func
sub_8013D10:
	push {lr}
	bl sub_8013BAC
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	pop {r0}
	bx r0
	.align 2, 0

