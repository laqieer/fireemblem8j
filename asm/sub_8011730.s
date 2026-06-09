	.syntax unified
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set NewPopup_Simple, 0x08011560 + 1
	.set SetPartyGoldAmount, 0x08024DB4 + 1
	.set SetPopupUnit, 0x08011554 + 1
	.section .text.sub_8011730, "ax", %progbits
@ sub_8011730 @ JP 0x08011730 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011730
	.thumb_func
sub_8011730:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r0, r5, #0
	bl SetPopupUnit
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08011768
	bl GetPartyGoldAmount
	adds r5, r5, r0
	adds r0, r5, #0
	bl SetPartyGoldAmount
	ldr r0, _08011764 @ =0x085BA0C4
	movs r1, #0x60
	movs r2, #0
	adds r3, r6, #0
	bl NewPopup_Simple
	b _08011774
	.align 2, 0
_08011764: .4byte 0x085BA0C4
_08011768:
	ldr r0, _0801177C @ =0x085BA0FC
	movs r1, #0x60
	movs r2, #0
	adds r3, r6, #0
	bl NewPopup_Simple
_08011774:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801177C: .4byte 0x085BA0FC

