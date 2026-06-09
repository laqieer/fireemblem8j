	.syntax unified
	.set GetItemHit, 0x0801739C + 1
	.section .text.sub_802AB1C, "ax", %progbits
@ sub_802AB1C @ JP 0x0802AB1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802AB1C
	.thumb_func
sub_802AB1C:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemHit
	movs r2, #0x15
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r2, r2, r0
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r0, r2
	adds r1, r4, #0
	adds r1, #0x53
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x60
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

