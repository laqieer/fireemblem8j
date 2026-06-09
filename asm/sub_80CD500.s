	.syntax unified
	.set sub_80CC178, 0x080CC178 + 1
	.set sub_80CC1B0, 0x080CC1B0 + 1
	.section .text.sub_80CD500, "ax", %progbits
@ sub_80CD500 @ JP 0x080CD500 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CD500
	.thumb_func
sub_80CD500:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x46
	ldrb r0, [r0]
	bl sub_80CC1B0
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl sub_80CC178
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

