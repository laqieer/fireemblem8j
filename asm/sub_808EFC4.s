	.syntax unified
	.set GetCursorQuadrant, 0x0808DEDC + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808DEBC, 0x0808DEBC + 1
	.set sub_808E8CC, 0x0808E8CC + 1
	.section .text.sub_808EFC4, "ax", %progbits
@ sub_808EFC4 @ JP 0x0808EFC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808EFC4
	.thumb_func
sub_808EFC4:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, _0808F060 @ =0x0202BCAC
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808F064 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _0808F058
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCursorQuadrant
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _0808F068 @ =0x08A738E0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #2
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_808DEBC
	adds r5, r0, #0
	ldr r0, _0808F06C @ =0x08A73964
	bl Proc_Find
	cmp r0, #0
	beq _0808F032
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808F032
	cmp r0, r5
	beq _0808F058
_0808F032:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	ldr r0, _0808F060 @ =0x0202BCAC
	ldrh r1, [r0, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r4, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_808E8CC
	adds r0, r4, #0
	bl sub_8002DE4
_0808F058:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808F060: .4byte 0x0202BCAC
_0808F064: .4byte 0x0202E4D4
_0808F068: .4byte 0x08A738E0
_0808F06C: .4byte 0x08A73964

