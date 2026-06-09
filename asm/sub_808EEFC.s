	.syntax unified
	.set GetCursorQuadrant, 0x0808DEDC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808E588, 0x0808E588 + 1
	.set sub_808EC60, 0x0808EC60 + 1
	.section .text.sub_808EEFC, "ax", %progbits
@ sub_808EEFC @ JP 0x0808EEFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808EEFC
	.thumb_func
sub_808EEFC:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _0808EF7C @ =0x0202BCAC
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3]
	ldrh r2, [r2]
	cmp r0, r2
	beq _0808EF96
	ldr r0, _0808EF80 @ =0x085C29C8
	bl Proc_Find
	cmp r0, #0
	bne _0808EF88
	bl GetCursorQuadrant
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r2, r3
	beq _0808EF6C
	ldr r1, _0808EF84 @ =0x08A738E0
	lsls r0, r2, #3
	adds r5, r0, r1
	lsls r0, r3, #3
	adds r2, r0, r1
	movs r1, #0
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808EF88
	movs r1, #1
	ldrsb r1, [r5, r1]
	movs r0, #1
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808EF88
_0808EF6C:
	adds r0, r4, #0
	bl sub_808EC60
	adds r0, r4, #0
	bl sub_808E588
	b _0808EF96
	.align 2, 0
_0808EF7C: .4byte 0x0202BCAC
_0808EF80: .4byte 0x085C29C8
_0808EF84: .4byte 0x08A738E0
_0808EF88:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0808EF96:
	pop {r4, r5}
	pop {r0}
	bx r0

