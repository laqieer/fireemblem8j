	.syntax unified
	.set GetUnitItemCount, 0x08017780 + 1
	.section .text.sub_8018A48, "ax", %progbits
@ sub_8018A48 @ JP 0x08018A48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8018A48
	.thumb_func
sub_8018A48:
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitItemCount
	subs r0, #1
	lsls r0, r0, #1
	adds r4, #0x1e
	adds r4, r4, r0
	ldrh r0, [r4]
	pop {r4}
	pop {r1}
	bx r1

