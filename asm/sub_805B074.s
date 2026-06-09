	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBattleAnimRoundType, 0x0805983C + 1
	.section .text.sub_805B074, "ax", %progbits
@ sub_805B074 @ JP 0x0805B074 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805B074
	.thumb_func
sub_805B074:
	push {r4, lr}
	adds r4, r0, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

