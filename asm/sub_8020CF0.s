	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set WfxFlamesInitGradientPublic, 0x080306A8 + 1
	.set j_ColorFadeTick, 0x080DC0EC + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8030B90, 0x08030B90 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8020CF0, "ax", %progbits
@ sub_8020CF0 @ JP 0x08020CF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8020CF0
	.thumb_func
sub_8020CF0:
	push {r4, r5, lr}
	adds r4, r0, #0
	bl j_ColorFadeTick
	ldr r5, _08020D4C @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _08020D0C
	bl WfxFlamesInitGradientPublic
_08020D0C:
	bl sub_80C1E74
	cmp r0, #2
	beq _08020D24
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	beq _08020D54
_08020D24:
	adds r3, r4, #0
	adds r3, #0x4c
	movs r0, #0
	strh r0, [r3]
	ldr r2, _08020D50 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	b _08020D5C
	.align 2, 0
_08020D4C: .4byte 0x0202BCEC
_08020D50: .4byte 0x03003020
_08020D54:
	bl sub_8001EE4
	adds r3, r4, #0
	adds r3, #0x4c
_08020D5C:
	ldrh r0, [r3]
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08020D72
	bl sub_8030B90
	adds r0, r4, #0
	bl sub_8002DE4
_08020D72:
	pop {r4, r5}
	pop {r0}
	bx r0

