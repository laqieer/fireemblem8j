	.syntax unified
	.set GetCursorQuadrant, 0x0808DEDC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808DEBC, 0x0808DEBC + 1
	.set sub_808EC60, 0x0808EC60 + 1
	.section .text.sub_808EE58, "ax", %progbits
@ sub_808EE58 @ JP 0x0808EE58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808EE58
	.thumb_func
sub_808EE58:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCursorQuadrant
	adds r1, r5, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _0808EEEC @ =0x08A738E0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_808DEBC
	adds r6, r0, #0
	ldr r0, _0808EEF0 @ =0x08A739C4
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0808EEA6
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808EEA6
	cmp r0, r6
	beq _0808EEE4
_0808EEA6:
	ldr r0, _0808EEF4 @ =0x08A73A9C
	bl Proc_Find
	cmp r4, #0
	beq _0808EEC0
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808EEC0
	cmp r0, r6
	beq _0808EEE4
_0808EEC0:
	adds r0, r5, #0
	adds r0, #0x57
	strb r6, [r0]
	adds r0, r5, #0
	bl sub_808EC60
	ldr r0, _0808EEF8 @ =0x0202BCAC
	ldrh r1, [r0, #0x14]
	adds r2, r5, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r5, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8002DE4
_0808EEE4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808EEEC: .4byte 0x08A738E0
_0808EEF0: .4byte 0x08A739C4
_0808EEF4: .4byte 0x08A73A9C
_0808EEF8: .4byte 0x0202BCAC

