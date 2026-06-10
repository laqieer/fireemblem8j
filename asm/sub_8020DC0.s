	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set ForceScreenToBlack, 0x08014268 + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_80310F4, 0x080310F4 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8020DC0, "ax", %progbits
@ sub_8020DC0 @ JP 0x08020DC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8020DC0
	.thumb_func
sub_8020DC0:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r4, _08020E74 @ =0x03003020
	ldrb r1, [r4, #0xc]
	movs r5, #4
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r5, #0
	ands r0, r1
	movs r1, #1
	mov sb, r1
	mov r1, sb
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r1, [r4, #0x14]
	adds r0, r5, #0
	ands r0, r1
	movs r1, #2
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r6, #3
	orrs r0, r6
	strb r0, [r4, #0x18]
	ldrb r1, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	ldr r0, _08020E78 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	bl BG_EnableSyncByMask
	ldrb r1, [r4, #0xc]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r5, #0
	ands r0, r1
	mov r1, sb
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strb r5, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r0, r6
	strb r0, [r4, #0x18]
	bl sub_80C1E74
	cmp r0, #2
	beq _08020E60
	ldr r0, _08020E7C @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	beq _08020E68
_08020E60:
	bl sub_80310F4
	bl ForceScreenToBlack
_08020E68:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020E74: .4byte 0x03003020
_08020E78: .4byte 0x02022CA8
_08020E7C: .4byte 0x0202BCEC

