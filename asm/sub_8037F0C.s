	.syntax unified
	.set GetUnitFromCharIdAndFaction, 0x08017FEC + 1
	.set sub_8011814, 0x08011814 + 1
	.set sub_801786C, 0x0801786C + 1
	.section .text.sub_8037F0C, "ax", %progbits
@ sub_8037F0C @ JP 0x08037F0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037F0C
	.thumb_func
sub_8037F0C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r4]
	movs r1, #0
	bl GetUnitFromCharIdAndFaction
	cmp r0, #0
	bne _08037F2C
	adds r0, r4, #0
	bl sub_801786C
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_8011814
_08037F2C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

