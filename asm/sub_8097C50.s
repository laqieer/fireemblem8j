	.syntax unified
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set sub_8012414, 0x08012414 + 1
	.section .text.sub_8097C50, "ax", %progbits
@ sub_8097C50 @ JP 0x08097C50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097C50
	.thumb_func
sub_8097C50:
	push {r4, r5, r6, lr}
	movs r5, #0
	bl sub_8012414
	adds r6, r0, #0
	movs r4, #0
	b _08097C80
_08097C5E:
	adds r0, r4, #0
	bl GetUnitFromPrepList
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r3, #8
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _08097C7E
	cmp r5, r6
	blt _08097C7C
	orrs r1, r3
	str r1, [r2, #0xc]
	b _08097C7E
_08097C7C:
	adds r5, #1
_08097C7E:
	adds r4, #1
_08097C80:
	bl PrepGetUnitAmount
	cmp r4, r0
	blt _08097C5E
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

