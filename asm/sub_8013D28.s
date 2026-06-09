	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8013C58, 0x08013C58 + 1
	.section .text.sub_8013D28, "ax", %progbits
@ sub_8013D28 @ JP 0x08013D28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013D28
	.thumb_func
sub_8013D28:
	push {lr}
	bl sub_8013C58
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	pop {r0}
	bx r0
	.align 2, 0

