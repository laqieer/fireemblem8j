	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBattleAnimRoundTypeFlags, 0x08059864 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056120, 0x08056120 + 1
	.set sub_806EE40, 0x0806EE40 + 1
	.section .text.sub_806EBA0, "ax", %progbits
@ sub_806EBA0 @ JP 0x0806EBA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806EBA0
	.thumb_func
sub_806EBA0:
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_8056120
	adds r0, r4, #0
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
	asrs r5, r1, #0x10
	cmp r5, #0
	beq _0806EBD2
	adds r0, r4, #0
	bl sub_806EE40
	b _0806EBDE
_0806EBD2:
	ldr r0, _0806EBE4 @ =0x08603414
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
_0806EBDE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EBE4: .4byte 0x08603414

