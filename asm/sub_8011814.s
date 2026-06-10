	.syntax unified
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set NewPopup_Simple, 0x08011560 + 1
	.set sub_801153C, 0x0801153C + 1
	.section .text.sub_8011814, "ax", %progbits
@ sub_8011814 @ JP 0x08011814 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011814
	.thumb_func
sub_8011814:
	push {r4, lr}
	adds r4, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl GetUnitFromCharId
	bl sub_801153C
	ldr r0, _08011838 @ =0x085BA21C
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopup_Simple
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011838: .4byte 0x085BA21C

