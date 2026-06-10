	.syntax unified
	.set ComputeBattleUnitBaseDefense, 0x0802AA10 + 1
	.set SetBattleUnitTerrainBonusesAuto, 0x0802A648 + 1
	.set sub_802A4F0, 0x0802A4F0 + 1
	.set sub_802A93C, 0x0802A93C + 1
	.set sub_802C624, 0x0802C624 + 1
	.section .text.sub_802CB00, "ax", %progbits
@ sub_802CB00 @ JP 0x0802CB00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802CB00
	.thumb_func
sub_802CB00:
	push {r4, lr}
	adds r1, r0, #0
	ldr r4, _0802CB4C @ =0x0203A568
	adds r0, r4, #0
	bl sub_802A4F0
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r4, #0
	bl ComputeBattleUnitBaseDefense
	adds r0, r4, #0
	movs r1, #0
	bl sub_802A93C
	adds r0, r4, #0
	adds r0, #0x5a
	movs r2, #0
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #0xa
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	subs r0, #0x20
	strh r2, [r0]
	adds r0, r4, #0
	bl sub_802C624
	ldr r0, _0802CB50 @ =0x0203A4E8
	adds r0, #0x7e
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CB4C: .4byte 0x0203A568
_0802CB50: .4byte 0x0203A4E8

