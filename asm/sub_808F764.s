	.syntax unified
	.set GetCursorQuadrant, 0x0808DEDC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808DEBC, 0x0808DEBC + 1
	.set sub_808F4FC, 0x0808F4FC + 1
	.section .text.sub_808F764, "ax", %progbits
@ sub_808F764 @ JP 0x0808F764 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808F764
	.thumb_func
sub_808F764:
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCursorQuadrant
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _0808F7F0 @ =0x08A738E0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_808DEBC
	adds r5, r0, #0
	ldr r0, _0808F7F4 @ =0x08A73964
	bl Proc_Find
	cmp r0, #0
	beq _0808F7B4
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808F7B4
	cmp r0, r5
	beq _0808F7E8
_0808F7B4:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_808F4FC
	ldr r1, _0808F7F8 @ =0x0202BCAC
	ldrh r0, [r1, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	adds r3, r4, #0
	adds r3, #0x4f
	strb r0, [r3]
	ldrb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x4c
	strb r1, [r0]
	ldrb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0808F7E8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808F7F0: .4byte 0x08A738E0
_0808F7F4: .4byte 0x08A73964
_0808F7F8: .4byte 0x0202BCAC

