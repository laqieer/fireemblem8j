	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_802C134, 0x0802C134 + 1
	.set sub_802C8BC, 0x0802C8BC + 1
	.section .text.sub_802BF70, "ax", %progbits
@ sub_802BF70 @ JP 0x0802BF70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802BF70
	.thumb_func
sub_802BF70:
	push {r4, r5, r6, r7, lr}
	ldr r5, _0802BFE4 @ =0x0203A4E8
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r7, r0, #0
	ldr r4, _0802BFE8 @ =0x0203A568
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802BFAC
	adds r0, r5, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0x1e
	adds r0, r0, r1
	adds r1, #0x2a
	ldrh r1, [r1]
	strh r1, [r0]
_0802BFAC:
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802BFCE
	adds r0, r4, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x1e
	adds r0, r0, r1
	adds r1, #0x2a
	ldrh r1, [r1]
	strh r1, [r0]
_0802BFCE:
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_802C134
	cmp r6, #0
	beq _0802BFEC
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_802C134
	b _0802BFF2
	.align 2, 0
_0802BFE4: .4byte 0x0203A4E8
_0802BFE8: .4byte 0x0203A568
_0802BFEC:
	adds r0, r4, #0
	bl sub_802C8BC
_0802BFF2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

