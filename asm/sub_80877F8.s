	.syntax unified
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set sub_8028768, 0x08028768 + 1
	.section .text.sub_80877F8, "ax", %progbits
@ sub_80877F8 @ JP 0x080877F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80877F8
	.thumb_func
sub_80877F8:
	push {r4, r5, lr}
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	bl GetUnitFromCharId
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitFromCharId
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8028768
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

