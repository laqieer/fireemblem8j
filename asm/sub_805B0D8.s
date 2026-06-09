	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBattleAnimRoundType, 0x0805983C + 1
	.section .text.sub_805B0D8, "ax", %progbits
@ sub_805B0D8 @ JP 0x0805B0D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805B0D8
	.thumb_func
sub_805B0D8:
	push {r4, lr}
	adds r4, r0, #0
	bl GetAnimPosition
	adds r2, r0, #0
	ldrh r0, [r4, #0xe]
	lsls r0, r0, #1
	movs r1, #1
	eors r1, r2
	adds r0, r0, r1
	bl GetBattleAnimRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

