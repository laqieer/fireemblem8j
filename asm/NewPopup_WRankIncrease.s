	.syntax unified
	.set NewPopup_Simple, 0x08011560 + 1
	.set sub_8011548, 0x08011548 + 1
	.section .text.NewPopup_WRankIncrease, "ax", %progbits
@ NewPopup_WRankIncrease @ JP 0x080117F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewPopup_WRankIncrease
	.thumb_func
NewPopup_WRankIncrease:
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8011548
	ldr r0, _08011810 @ =0x085BA1F4
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopup_Simple
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011810: .4byte 0x085BA1F4

