	.syntax unified
	.set GetCharacterData, 0x0801913C + 1
	.set GetClassData, 0x0801911C + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set sub_801759C, 0x0801759C + 1
	.section .text.sub_802C7FC, "ax", %progbits
@ sub_802C7FC @ JP 0x0802C7FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802C7FC
	.thumb_func
sub_802C7FC:
	push {r4, lr}
	ldr r4, _0802C854 @ =0x0203A568
	adds r0, r4, #0
	bl sub_801759C
	movs r0, #0
	strb r0, [r4, #0xb]
	movs r0, #1
	bl GetClassData
	str r0, [r4, #4]
	ldr r0, _0802C858 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r4, #0x12]
	ldr r1, _0802C85C @ =0x0203A954
	ldrb r0, [r1, #0x15]
	strb r0, [r4, #0x13]
	ldrb r0, [r1, #0x13]
	strb r0, [r4, #0x10]
	ldrb r0, [r1, #0x14]
	strb r0, [r4, #0x11]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _0802C860 @ =0x0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0802C864
	cmp r0, #0x33
	beq _0802C86E
	b _0802C87A
	.align 2, 0
_0802C854: .4byte 0x0203A568
_0802C858: .4byte 0x0202BCEC
_0802C85C: .4byte 0x0203A954
_0802C860: .4byte 0x0202E4D8
_0802C864:
	movs r0, #0xfe
	bl GetCharacterData
	str r0, [r4]
	b _0802C87A
_0802C86E:
	movs r0, #0xff
	bl GetCharacterData
	str r0, [r4]
	movs r0, #0x14
	strb r0, [r4, #0x12]
_0802C87A:
	pop {r4}
	pop {r0}
	bx r0

