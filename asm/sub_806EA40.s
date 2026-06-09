	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBattleAnimRoundTypeFlags, 0x08059864 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056120, 0x08056120 + 1
	.set sub_806ED0C, 0x0806ED0C + 1
	.section .text.sub_806EA40, "ax", %progbits
@ sub_806EA40 @ JP 0x0806EA40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806EA40
	.thumb_func
sub_806EA40:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	cmp r4, #0
	beq _0806EA72
	adds r0, r5, #0
	bl sub_806ED0C
	b _0806EA82
_0806EA72:
	bl sub_8056120
	ldr r0, _0806EA88 @ =0x086033C4
	movs r1, #3
	bl sub_8002BCC
	str r5, [r0, #0x5c]
	strh r4, [r0, #0x2c]
_0806EA82:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EA88: .4byte 0x086033C4

