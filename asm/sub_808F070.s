	.syntax unified
	.set GetCursorQuadrant, 0x0808DEDC + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808E534, 0x0808E534 + 1
	.set sub_808E75C, 0x0808E75C + 1
	.section .text.sub_808F070, "ax", %progbits
@ sub_808F070 @ JP 0x0808F070 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808F070
	.thumb_func
sub_808F070:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _0808F128 @ =0x0202BCAC
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	ldr r1, _0808F12C @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_808E75C
	ldrh r1, [r4]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _0808F0B4
	adds r0, r5, #0
	bl sub_808E534
_0808F0B4:
	adds r3, r5, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r1, r5, #0
	adds r1, #0x4c
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x4f
	ldrb r0, [r4]
	adds r2, r5, #0
	adds r2, #0x4d
	strb r0, [r2]
	ldrh r0, [r6, #0x14]
	strb r0, [r3]
	ldrh r0, [r6, #0x16]
	strb r0, [r4]
	ldrh r0, [r3]
	ldrh r1, [r1]
	cmp r0, r1
	beq _0808F146
	cmp r7, #0
	beq _0808F138
	ldr r0, _0808F130 @ =0x085C29C8
	bl Proc_Find
	cmp r0, #0
	bne _0808F138
	bl GetCursorQuadrant
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x50
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r2, r3
	beq _0808F11E
	ldr r1, _0808F134 @ =0x08A738E0
	lsls r0, r2, #3
	adds r4, r0, r1
	lsls r0, r3, #3
	adds r2, r0, r1
	movs r1, #2
	ldrsb r1, [r4, r1]
	movs r0, #2
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808F138
	movs r1, #3
	ldrsb r1, [r4, r1]
	movs r0, #3
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808F138
_0808F11E:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _0808F146
	.align 2, 0
_0808F128: .4byte 0x0202BCAC
_0808F12C: .4byte 0x0202E4D4
_0808F130: .4byte 0x085C29C8
_0808F134: .4byte 0x08A738E0
_0808F138:
	adds r1, r5, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8002DE4
_0808F146:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

