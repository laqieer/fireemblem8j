	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set InitText, 0x08003C8C + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80043DC, 0x080043DC + 1
	.set sub_80048B4, 0x080048B4 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80900E0, 0x080900E0 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_808F584, "ax", %progbits
@ GoalDisplay_Init @ JP 0x0808F584 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GoalDisplay_Init
	.thumb_func
GoalDisplay_Init:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r1, #0
	str r1, [r6, #0x58]
	adds r0, #0x56
	strb r1, [r0]
	subs r0, #6
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r5, r6, #0
	adds r5, #0x2c
	adds r0, r5, #0
	movs r1, #8
	bl InitText
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	adds r0, r6, #0
	bl sub_80048B4
	adds r0, r5, #0
	bl sub_8003CF8
	adds r0, r4, #0
	bl sub_8003CF8
	bl sub_80C1E74
	cmp r0, #2
	beq _0808F5E4
	ldr r0, _0808F5E0 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x8a
	ldrh r0, [r0]
	b _0808F5E8
	.align 2, 0
_0808F5E0: .4byte 0x0202BCEC
_0808F5E4:
	movs r0, #0x93
	lsls r0, r0, #1
_0808F5E8:
	bl sub_8009FA8
	adds r5, r0, #0
	adds r4, r6, #0
	adds r4, #0x2c
	movs r0, #0x40
	adds r1, r5, #0
	bl sub_8003EAC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl sub_80043B8
	bl sub_80C1E74
	cmp r0, #2
	beq _0808F624
	ldr r0, _0808F620 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x8c
	ldrb r0, [r0]
	b _0808F626
	.align 2, 0
_0808F620: .4byte 0x0202BCEC
_0808F624:
	movs r0, #1
_0808F626:
	cmp r0, #4
	bls _0808F62C
	b _0808F75A
_0808F62C:
	lsls r0, r0, #2
	ldr r1, _0808F638 @ =_0808F63C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808F638: .4byte _0808F63C
_0808F63C: @ jump table
	.4byte _0808F650 @ case 0
	.4byte _0808F658 @ case 1
	.4byte _0808F6A4 @ case 2
	.4byte _0808F650 @ case 3
	.4byte _0808F650 @ case 4
_0808F650:
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #0
	b _0808F758
_0808F658:
	adds r4, r6, #0
	adds r4, #0x34
	ldr r3, _0808F684 @ =0x081F5528
	adds r0, r4, #0
	movs r1, #0x14
	movs r2, #0
	bl sub_80043B8
	ldr r0, _0808F688 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0808F690
	ldr r0, _0808F68C @ =0x000004C5
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x24
	movs r2, #1
	bl sub_80043B8
	b _0808F752
	.align 2, 0
_0808F684: .4byte 0x081F5528
_0808F688: .4byte 0x0202BCEC
_0808F68C: .4byte 0x000004C5
_0808F690:
	movs r0, #0x80
	bl sub_80900E0
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x2c
	movs r2, #2
	bl sub_80043DC
	b _0808F752
_0808F6A4:
	ldr r4, _0808F6C4 @ =0x0202BCEC
	ldrh r5, [r4, #0x10]
	bl sub_80C1E74
	cmp r0, #2
	beq _0808F6C8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x8d
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _0808F6D0
	b _0808F6F0
	.align 2, 0
_0808F6C4: .4byte 0x0202BCEC
_0808F6C8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	blt _0808F6F0
_0808F6D0:
	ldr r5, _0808F6EC @ =0x081F5530
	adds r4, r6, #0
	adds r4, #0x34
	movs r0, #0x40
	adds r1, r5, #0
	bl sub_8003EAC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #4
	adds r3, r5, #0
	bl sub_80043B8
	b _0808F752
	.align 2, 0
_0808F6EC: .4byte 0x081F5530
_0808F6F0:
	adds r4, r6, #0
	adds r4, #0x34
	ldr r7, _0808F730 @ =0x0202BCEC
	ldrh r3, [r7, #0x10]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #2
	bl sub_80043DC
	ldr r0, _0808F734 @ =0x000004C9
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #0
	bl sub_80043B8
	bl sub_80C1E74
	adds r5, r4, #0
	cmp r0, #2
	beq _0808F738
	movs r0, #0xe
	ldrsb r0, [r7, r0]
	bl GetROMChapterStruct
	adds r0, #0x8d
	ldrb r0, [r0]
	subs r3, r0, #1
	b _0808F73C
	.align 2, 0
_0808F730: .4byte 0x0202BCEC
_0808F734: .4byte 0x000004C9
_0808F738:
	movs r3, #1
	rsbs r3, r3, #0
_0808F73C:
	adds r0, r4, #0
	movs r1, #0x22
	movs r2, #2
	bl sub_80043DC
	ldr r3, _0808F760 @ =0x081F553C
	adds r0, r5, #0
	movs r1, #0x2a
	movs r2, #0
	bl sub_80043B8
_0808F752:
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #1
_0808F758:
	strh r0, [r1]
_0808F75A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F760: .4byte 0x081F553C

