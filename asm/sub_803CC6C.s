	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set sub_803B904, 0x0803B904 + 1
	.set sub_803BA10, 0x0803BA10 + 1
	.set sub_803BFA4, 0x0803BFA4 + 1
	.set sub_80407C4, 0x080407C4 + 1
	.section .text.sub_803CC6C, "ax", %progbits
@ sub_803CC6C @ JP 0x0803CC6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803CC6C
	.thumb_func
sub_803CC6C:
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl sub_80407C4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CCBC
	ldr r3, _0803CCB0 @ =0x030017C8
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _0803CD58
	ldr r2, _0803CCB4 @ =0x03004DF0
	ldr r1, [r2]
	adds r1, #0x46
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x46
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne _0803CD58
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _0803CCB8 @ =0x030017C0
	movs r0, #0
	b _0803CD56
	.align 2, 0
_0803CCB0: .4byte 0x030017C8
_0803CCB4: .4byte 0x03004DF0
_0803CCB8: .4byte 0x030017C0
_0803CCBC:
	add r4, sp, #0x10
	adds r0, r4, #0
	add r1, sp, #0xc
	bl sub_803B904
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _0803CD4C
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl sub_803BA10
	ldr r4, _0803CD3C @ =0x0203AA90
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_803BFA4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CD58
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r2, #4
	movs r3, #0
	bl AiSetDecision
	ldr r3, _0803CD40 @ =0x030017C8
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _0803CD58
	ldr r2, _0803CD44 @ =0x03004DF0
	ldr r1, [r2]
	adds r1, #0x46
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x46
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne _0803CD58
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _0803CD48 @ =0x030017C0
	strb r4, [r0]
	b _0803CD58
	.align 2, 0
_0803CD3C: .4byte 0x0203AA90
_0803CD40: .4byte 0x030017C8
_0803CD44: .4byte 0x03004DF0
_0803CD48: .4byte 0x030017C0
_0803CD4C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _0803CD60 @ =0x030017C0
	movs r0, #0
_0803CD56:
	strb r0, [r1]
_0803CD58:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CD60: .4byte 0x030017C0

