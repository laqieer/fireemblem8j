	.syntax unified
	.set NewPopup_Simple, 0x08011560 + 1
	.set sub_8011548, 0x08011548 + 1
	.section .text.NewPopup_ItemGot_unused, "ax", %progbits
@ NewPopup_ItemGot_unused @ JP 0x080115C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewPopup_ItemGot_unused
	.thumb_func
NewPopup_ItemGot_unused:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8011548
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080115F8
	ldr r0, _080115F4 @ =0x085BA014
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl NewPopup_Simple
	b _08011604
	.align 2, 0
_080115F4: .4byte 0x085BA014
_080115F8:
	ldr r0, _0801160C @ =0x085BA054
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl NewPopup_Simple
_08011604:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801160C: .4byte 0x085BA054

