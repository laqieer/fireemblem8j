	.syntax unified
	.set NewPopup_Simple, 0x08011560 + 1
	.set SetPopupUnit, 0x08011554 + 1
	.section .text.NewGoldNumPopup_unused, "ax", %progbits
@ NewGoldNumPopup_unused @ JP 0x080116C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewGoldNumPopup_unused
	.thumb_func
NewGoldNumPopup_unused:
	push {r4, lr}
	adds r4, r1, #0
	bl SetPopupUnit
	ldr r0, _080116F0 @ =0x03004DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080116F8
	ldr r0, _080116F4 @ =0x085BA0C4
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopup_Simple
	b _08011704
	.align 2, 0
_080116F0: .4byte 0x03004DF0
_080116F4: .4byte 0x085BA0C4
_080116F8:
	ldr r0, _0801170C @ =0x085BA0FC
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopup_Simple
_08011704:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801170C: .4byte 0x085BA0FC

