	.syntax unified
	.set BattleUnwind, 0x0802AE40 + 1
	.set ComputeBattleObstacleStats, 0x0802C880 + 1
	.set sub_802A8C8, 0x0802A8C8 + 1
	.set sub_802A914, 0x0802A914 + 1
	.set sub_802CE84, 0x0802CE84 + 1
	.section .text.sub_802A324, "ax", %progbits
@ sub_802A324 @ JP 0x0802A324 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802A324
	.thumb_func
sub_802A324:
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, _0802A370 @ =0x0203A4E8
	ldr r4, _0802A374 @ =0x0203A568
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_802A8C8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802A8C8
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_802A914
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802A914
	cmp r6, #0
	bne _0802A354
	bl ComputeBattleObstacleStats
_0802A354:
	ldr r0, _0802A378 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802A380
	ldr r0, _0802A37C @ =0x0203A954
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0802A380
	bl sub_802CE84
	b _0802A384
	.align 2, 0
_0802A370: .4byte 0x0203A4E8
_0802A374: .4byte 0x0203A568
_0802A378: .4byte 0x0203A4D0
_0802A37C: .4byte 0x0203A954
_0802A380:
	bl BattleUnwind
_0802A384:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

