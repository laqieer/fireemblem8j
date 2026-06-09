	.syntax unified
	.set GetCursorQuadrant, 0x0808DEDC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_808FA6C, "ax", %progbits
@ sub_808FA6C @ JP 0x0808FA6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808FA6C
	.thumb_func
sub_808FA6C:
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
	ldr r1, _0808FAF0 @ =0x0202BCAC
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3]
	ldrh r2, [r2]
	cmp r0, r2
	beq _0808FAEA
	ldr r0, _0808FAF4 @ =0x085C29C8
	bl Proc_Find
	cmp r0, #0
	bne _0808FADC
	bl GetCursorQuadrant
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r2, r3
	beq _0808FAEA
	ldr r1, _0808FAF8 @ =0x08A738E0
	lsls r0, r2, #3
	adds r5, r0, r1
	lsls r0, r3, #3
	adds r2, r0, r1
	movs r1, #4
	ldrsb r1, [r5, r1]
	movs r0, #4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808FADC
	movs r1, #5
	ldrsb r1, [r5, r1]
	movs r0, #5
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq _0808FAEA
_0808FADC:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0808FAEA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808FAF0: .4byte 0x0202BCAC
_0808FAF4: .4byte 0x085C29C8
_0808FAF8: .4byte 0x08A738E0

