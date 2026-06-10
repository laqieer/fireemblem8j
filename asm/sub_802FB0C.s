	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set GetUnit, 0x08019108 + 1
	.set SetUnitStatusExt, 0x0801769C + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB00, 0x0802CB00 + 1
	.set sub_802CB8C, 0x0802CB8C + 1
	.section .text.sub_802FB0C, "ax", %progbits
@ sub_802FB0C @ JP 0x0802FB0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802FB0C
	.thumb_func
sub_802FB0C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _0802FB4C @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl sub_802CA5C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl sub_802CB00
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x7e
	beq _0802FB5E
	cmp r0, #0x7e
	bgt _0802FB50
	cmp r0, #0x7d
	beq _0802FB5A
	b _0802FB68
	.align 2, 0
_0802FB4C: .4byte 0x0203A954
_0802FB50:
	cmp r0, #0x7f
	beq _0802FB62
	cmp r0, #0x80
	beq _0802FB66
	b _0802FB68
_0802FB5A:
	movs r5, #5
	b _0802FB68
_0802FB5E:
	movs r5, #6
	b _0802FB68
_0802FB62:
	movs r5, #7
	b _0802FB68
_0802FB66:
	movs r5, #8
_0802FB68:
	ldr r0, _0802FB90 @ =0x0203A954
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r5, #0
	movs r2, #1
	bl SetUnitStatusExt
	ldr r1, _0802FB94 @ =0x0203A4D0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	adds r0, r6, #0
	bl sub_802CB8C
	bl sub_802C94C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802FB90: .4byte 0x0203A954
_0802FB94: .4byte 0x0203A4D0

