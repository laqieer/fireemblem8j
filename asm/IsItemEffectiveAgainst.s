	.syntax unified
	.section .text.IsItemEffectiveAgainst, "ax", %progbits
@ IsItemEffectiveAgainst @ JP 0x08016994 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global IsItemEffectiveAgainst
	.thumb_func
IsItemEffectiveAgainst:
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _08016A28
	ldrb r2, [r0, #4]
	movs r0, #0xff
	ands r0, r3
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080169BC @ =0x0885E068
	adds r1, r1, r0
	ldr r1, [r1, #0x10]
	adds r5, r0, #0
	cmp r1, #0
	beq _08016A28
	b _080169C8
	.align 2, 0
_080169BC: .4byte 0x0885E068
_080169C0:
	ldrb r0, [r1]
	cmp r0, r2
	beq _080169D0
	adds r1, #1
_080169C8:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080169C0
	b _08016A28
_080169D0:
	movs r0, #0xff
	ands r0, r3
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r1, [r1, #0x10]
	ldr r0, _08016A1C @ =0x089024B6
	cmp r1, r0
	beq _080169EA
	ldr r0, _08016A20 @ =0x0890247D
	cmp r1, r0
	bne _08016A18
_080169EA:
	movs r3, #0
	movs r6, #0xff
	ldr r5, _08016A24 @ =0x0885E068
	adds r2, r4, #0
	adds r2, #0x1e
	movs r4, #4
_080169F6:
	ldrh r0, [r2]
	ands r0, r6
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r0, [r1, #8]
	orrs r3, r0
	adds r2, #2
	subs r4, #1
	cmp r4, #0
	bge _080169F6
	movs r0, #0x80
	lsls r0, r0, #7
	ands r3, r0
	cmp r3, #0
	bne _08016A28
_08016A18:
	movs r0, #1
	b _08016A2A
	.align 2, 0
_08016A1C: .4byte 0x089024B6
_08016A20: .4byte 0x0890247D
_08016A24: .4byte 0x0885E068
_08016A28:
	movs r0, #0
_08016A2A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

