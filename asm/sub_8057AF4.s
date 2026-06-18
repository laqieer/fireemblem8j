	.syntax unified
	.set AnimDisplay, 0x08004F3C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8073D00, 0x08073D00 + 1
	.section .text.sub_8057AF4, "ax", %progbits
@ UnitKakudaiMain @ JP 0x08057AF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnitKakudaiMain
	.thumb_func
UnitKakudaiMain:
	push {r4, r5, r6, r7, lr}
	ldr r4, _08057B14 @ =0xFFFFFCB4
	add sp, r4
	adds r4, r0, #0
	add r5, sp, #0x304
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08057B18
	adds r0, r4, #0
	bl sub_8002DE4
	b _08057C92
	.align 2, 0
_08057B14: .4byte 0xFFFFFCB4
_08057B18:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08057B30
	movs r1, #0x94
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	b _08057B3C
_08057B30:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x94
	lsls r2, r2, #2
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
_08057B3C:
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl sub_8012E84
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	ldr r0, [r4, #0x4c]
	cmp r0, #1
	bne _08057BF0
	ldr r0, [r4, #0x54]
	movs r1, #0
	str r1, [sp]
	add r1, sp, #4
	adds r2, r7, #0
	adds r3, r7, #0
	bl sub_8073D00
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08057B98
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r3, #0x36
	ldrsh r2, [r4, r3]
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl sub_8012E84
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x58
	b _08057BC6
_08057B98:
	movs r3, #0x36
	ldrsh r1, [r4, r3]
	movs r6, #0x32
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl sub_8012E84
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #0x3a
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
_08057BC6:
	bl sub_8012E84
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	add r3, sp, #4
	str r3, [r5, #0x3c]
	movs r1, #0
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r5, #2]
	strh r2, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r5, #0xc]
	movs r0, #0xe4
	lsls r0, r0, #7
	strh r0, [r5, #8]
	str r1, [r5, #0x1c]
	adds r0, r5, #0
	bl AnimDisplay
_08057BF0:
	ldr r1, [r4, #0x50]
	cmp r1, #1
	bne _08057C92
	ldr r0, [r4, #0x58]
	str r1, [sp]
	add r1, sp, #4
	adds r2, r7, #0
	adds r3, r7, #0
	bl sub_8073D00
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08057C3A
	movs r6, #0x34
	ldrsh r1, [r4, r6]
	movs r0, #0x38
	ldrsh r2, [r4, r0]
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl sub_8012E84
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x58
	b _08057C68
_08057C3A:
	movs r3, #0x38
	ldrsh r1, [r4, r3]
	movs r6, #0x34
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl sub_8012E84
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #0x3c
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
_08057C68:
	bl sub_8012E84
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	add r3, sp, #4
	str r3, [r5, #0x3c]
	movs r1, #0
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r5, #2]
	strh r2, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r5, #0xc]
	movs r0, #0x93
	lsls r0, r0, #8
	strh r0, [r5, #8]
	str r1, [r5, #0x1c]
	adds r0, r5, #0
	bl AnimDisplay
_08057C92:
	movs r3, #0xd3
	lsls r3, r3, #2
	add sp, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

