	.syntax unified
	.set ComputeBattleUnitEffectiveHitRate, 0x0802ABD0 + 1
	.set ComputeBattleUnitSilencerRate, 0x0802AC68 + 1
	.set sub_802AC00, 0x0802AC00 + 1
	.set sub_802AD3C, 0x0802AD3C + 1
	.section .text.sub_802A914, "ax", %progbits
@ sub_802A914 @ JP 0x0802A914 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802A914
	.thumb_func
sub_802A914:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ComputeBattleUnitEffectiveHitRate
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802AC00
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitSilencerRate
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802AD3C
	pop {r4, r5}
	pop {r0}
	bx r0

