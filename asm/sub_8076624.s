	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8076624, "ax", %progbits
@ sub_8076624 @ JP 0x08076624 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076624
	.thumb_func
sub_8076624:
	push {lr}
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r2, [r0]
	cmp r2, #0
	beq _08076638
	adds r0, r1, #0
	bl sub_8002DE4
	b _08076650
_08076638:
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	bgt _08076650
	strh r2, [r1, #0x2c]
	strh r2, [r1, #0x2e]
	adds r0, r1, #0
	bl sub_8002DE4
_08076650:
	pop {r0}
	bx r0

