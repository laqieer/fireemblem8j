	.syntax unified
	.set NewPopup_Simple, 0x08011560 + 1
	.set sub_8011548, 0x08011548 + 1
	.section .text.NewPopup_ItemStealing, "ax", %progbits
@ NewPopup_ItemStealing @ JP 0x08011780 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewPopup_ItemStealing
	.thumb_func
NewPopup_ItemStealing:
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8011548
	ldr r0, _080117AC @ =0x03004DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080117B4
	ldr r0, _080117B0 @ =0x085BA134
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopup_Simple
	b _080117C0
	.align 2, 0
_080117AC: .4byte 0x03004DF0
_080117B0: .4byte 0x085BA134
_080117B4:
	ldr r0, _080117C8 @ =0x085BA174
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopup_Simple
_080117C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080117C8: .4byte 0x085BA174

