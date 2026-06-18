	.syntax unified
	.set sub_802881C, 0x0802881C + 1
	.section .text.sub_8016FE4, "ax", %progbits
@ GetUnitItemUseReachBits @ JP 0x08016FE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetUnitItemUseReachBits
	.thumb_func
GetUnitItemUseReachBits:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	cmp r1, #0
	blt _08017028
	lsls r0, r1, #1
	adds r1, r5, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r4, [r1]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_802881C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08017096
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08017024 @ =0x0885E068
	adds r0, r0, r1
	ldrb r0, [r0, #0x19]
	movs r6, #0xf
	ands r6, r0
	cmp r6, #0
	bne _08017072
	movs r6, #0x63
	b _08017072
	.align 2, 0
_08017024: .4byte 0x0885E068
_08017028:
	movs r7, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _08017072
_08017030:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_802881C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801705E
	movs r1, #0xff
	ands r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08017080 @ =0x0885E068
	adds r0, r0, r1
	ldrb r0, [r0, #0x19]
	movs r4, #0xf
	ands r4, r0
	cmp r4, #0
	bne _08017058
	movs r4, #0x63
_08017058:
	cmp r6, r4
	bge _0801705E
	adds r6, r4, #0
_0801705E:
	adds r7, #1
	cmp r7, #4
	bgt _08017072
	lsls r1, r7, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08017030
_08017072:
	cmp r6, #2
	beq _0801708E
	cmp r6, #2
	bgt _08017084
	cmp r6, #1
	beq _0801708A
	b _08017096
	.align 2, 0
_08017080: .4byte 0x0885E068
_08017084:
	cmp r6, #0x63
	beq _08017092
	b _08017096
_0801708A:
	movs r0, #1
	b _08017098
_0801708E:
	movs r0, #3
	b _08017098
_08017092:
	movs r0, #0x20
	b _08017098
_08017096:
	movs r0, #0
_08017098:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

