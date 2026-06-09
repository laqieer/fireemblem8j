	.syntax unified
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set sub_8033168, 0x08033168 + 1
	.section .text.sub_801DA8C, "ax", %progbits
@ sub_801DA8C @ JP 0x0801DA8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DA8C
	.thumb_func
sub_801DA8C:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _0801DAD0 @ =0x0202BCEC
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	bne _0801DAAC
	bl sub_8033168
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldrb r0, [r1, #0x10]
	strb r0, [r4, #0x12]
	ldrb r0, [r1, #0x11]
	strb r0, [r4, #0x13]
_0801DAAC:
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0801DAD4
	bl sub_8033168
	bl GetUnitFromCharId
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	str r0, [r5]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	b _0801DADA
	.align 2, 0
_0801DAD0: .4byte 0x0202BCEC
_0801DAD4:
	ldrb r0, [r4, #0x12]
	str r0, [r5]
	ldrb r0, [r4, #0x13]
_0801DADA:
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

