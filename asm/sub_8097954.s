	.syntax unified
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set sub_8089088, 0x08089088 + 1
	.section .text.sub_8097954, "ax", %progbits
@ sub_8097954 @ JP 0x08097954 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097954
	.thumb_func
sub_8097954:
	push {r4, r5, lr}
	movs r5, #0
	b _08097976
_0809795A:
	bl sub_8089088
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitFromPrepList
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bne _08097974
	adds r0, r5, #0
	b _08097980
_08097974:
	adds r5, #1
_08097976:
	bl PrepGetUnitAmount
	cmp r5, r0
	blt _0809795A
	movs r0, #0
_08097980:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

