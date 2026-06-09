	.syntax unified
	.set GetItemUses, 0x0801732C + 1
	.set sub_802EAC4, 0x0802EAC4 + 1
	.section .text.sub_802C248, "ax", %progbits
@ sub_802C248 @ JP 0x0802C248 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802C248
	.thumb_func
sub_802C248:
	push {r4, r5, lr}
	ldr r0, _0802C274 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0802C26C
	ldr r4, _0802C278 @ =0x0203A4E8
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemUses
	adds r5, r0, #0
	ldrb r0, [r4, #0x1c]
	bl sub_802EAC4
	strb r5, [r0, #6]
_0802C26C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C274: .4byte 0x0203A4D0
_0802C278: .4byte 0x0203A4E8

