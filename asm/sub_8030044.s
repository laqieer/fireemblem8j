	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.section .text.sub_8030044, "ax", %progbits
@ sub_8030044 @ JP 0x08030044 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030044
	.thumb_func
sub_8030044:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	ldr r5, _08030080 @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldr r6, _08030084 @ =0x08907BC8
	ldrb r0, [r0, #9]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r4, #0x30]
	str r0, [r4, #0x2c]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r4, #0x3c]
	str r0, [r4, #0x38]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030080: .4byte 0x0202BCEC
_08030084: .4byte 0x08907BC8

