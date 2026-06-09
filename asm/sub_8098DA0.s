	.syntax unified
	.set CheckInLinkArena, 0x08042E1C + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set sub_8009608, 0x08009608 + 1
	.set sub_8026F38, 0x08026F38 + 1
	.set sub_80C572C, 0x080C572C + 1
	.section .text.sub_8098DA0, "ax", %progbits
@ sub_8098DA0 @ JP 0x08098DA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098DA0
	.thumb_func
sub_8098DA0:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x36]
	bl sub_8026F38
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08098DE0
	ldr r0, _08098DD8 @ =0x08A97C2C
	ldr r3, _08098DDC @ =0x00009E40
	movs r1, #1
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x3c
	movs r2, #0x10
	bl sub_8009608
	str r0, [r5, #0x38]
	b _08098E6A
	.align 2, 0
_08098DD8: .4byte 0x08A97C2C
_08098DDC: .4byte 0x00009E40
_08098DE0:
	ldr r0, _08098E0C @ =0x08A97C2C
	ldr r3, _08098E10 @ =0x00009E40
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x3c
	movs r2, #0x10
	bl sub_8009608
	str r0, [r5, #0x38]
	ldr r0, _08098E14 @ =0x0202BCEC
	movs r4, #0xe
	ldrsb r4, [r0, r4]
	adds r0, r4, #0
	subs r0, #0x24
	cmp r0, #9
	bhi _08098E18
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #2
	b _08098E58
	.align 2, 0
_08098E0C: .4byte 0x08A97C2C
_08098E10: .4byte 0x00009E40
_08098E14: .4byte 0x0202BCEC
_08098E18:
	adds r0, r4, #0
	subs r0, #0x2e
	cmp r0, #9
	bhi _08098E28
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #3
	b _08098E58
_08098E28:
	adds r0, r4, #0
	bl sub_80C572C
	cmp r0, #0
	beq _08098E3A
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #4
	b _08098E58
_08098E3A:
	adds r0, r4, #0
	subs r0, #0x15
	cmp r0, #1
	bls _08098E4A
	cmp r4, #0x22
	beq _08098E4A
	cmp r4, #0x23
	bne _08098E52
_08098E4A:
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0
	b _08098E58
_08098E52:
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #1
_08098E58:
	strb r0, [r1]
	adds r0, r4, #0
	bl GetROMChapterStruct
	adds r0, #0x80
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
_08098E6A:
	adds r1, r5, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x33
	movs r1, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

