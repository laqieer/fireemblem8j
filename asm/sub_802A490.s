	.syntax unified
	.set Roll1RN, 0x08000C78 + 1
	.section .text.sub_802A490, "ax", %progbits
@ BattleRoll1RN @ JP 0x0802A490 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BattleRoll1RN
	.thumb_func
BattleRoll1RN:
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	asrs r2, r1, #0x18
	ldr r0, _0802A4B4 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802A4B8
	adds r0, r3, #0
	bl Roll1RN
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802A4BA
	.align 2, 0
_0802A4B4: .4byte 0x0203A4D0
_0802A4B8:
	adds r0, r2, #0
_0802A4BA:
	pop {r1}
	bx r1
	.align 2, 0

