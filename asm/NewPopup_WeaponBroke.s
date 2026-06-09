	.syntax unified
	.set NewPopup_Simple, 0x08011560 + 1
	.set sub_8011548, 0x08011548 + 1
	.section .text.NewPopup_WeaponBroke, "ax", %progbits
@ NewPopup_WeaponBroke @ JP 0x080117CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewPopup_WeaponBroke
	.thumb_func
NewPopup_WeaponBroke:
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8011548
	ldr r0, _080117EC @ =0x085BA1B4
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopup_Simple
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080117EC: .4byte 0x085BA1B4

