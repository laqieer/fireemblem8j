	.syntax unified
	.set SramOffsetToAddr, 0x080A7918 + 1
	.set sub_80AAE20, 0x080AAE20 + 1
	.section .text.sub_80AAE6C, "ax", %progbits
@ sub_80AAE6C @ JP 0x080AAE6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AAE6C
	.thumb_func
sub_80AAE6C:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r5, [r4, #0xa]
	ldrh r0, [r4, #8]
	bl SramOffsetToAddr
	adds r1, r5, #0
	bl sub_80AAE20
	str r0, [r4, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

