	.syntax unified
	.set sub_804F528, 0x0804F528 + 1
	.set sub_804F5D4, 0x0804F5D4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.section .text.sub_802DC10, "ax", %progbits
@ sub_802DC10 @ JP 0x0802DC10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802DC10
	.thumb_func
sub_802DC10:
	push {r4, r5, r6, lr}
	ldr r4, [r0, #0x14]
	adds r5, r4, #0
	adds r5, #0x45
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802DC3E
	adds r2, r4, #0
	adds r2, #0x47
	adds r0, r4, #0
	adds r0, #0x46
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrb r2, [r2]
	adds r0, r0, r2
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
_0802DC3E:
	bl sub_808B2A4
	ldr r6, _0802DCA0 @ =0x085C3FBC
	adds r2, r4, #0
	adds r2, #0x42
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804F528
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802DC98
	adds r2, r4, #0
	adds r2, #0x44
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804F5D4
_0802DC98:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DCA0: .4byte 0x085C3FBC

