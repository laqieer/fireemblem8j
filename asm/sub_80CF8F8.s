	.syntax unified
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.section .text.sub_80CF8F8, "ax", %progbits
@ sub_80CF8F8 @ JP 0x080CF8F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CF8F8
	.thumb_func
sub_80CF8F8:
	push {r4, lr}
	adds r4, r0, #0
	bl SetDefaultColorEffects
	adds r4, #0x46
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

