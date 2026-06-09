	.syntax unified
	.section .text.sub_8028768, "ax", %progbits
@ sub_8028768 @ JP 0x08028768 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8028768
	.thumb_func
sub_8028768:
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	cmp r2, #0
	beq _08028816
	cmp r3, #0
	beq _08028816
	movs r1, #8
	ldrsb r1, [r2, r1]
	ldrb r0, [r3, #8]
	strb r0, [r2, #8]
	strb r1, [r3, #8]
	movs r1, #9
	ldrsb r1, [r2, r1]
	ldrb r0, [r3, #9]
	strb r0, [r2, #9]
	strb r1, [r3, #9]
	movs r1, #0x12
	ldrsb r1, [r2, r1]
	ldrb r0, [r3, #0x12]
	strb r0, [r2, #0x12]
	strb r1, [r3, #0x12]
	movs r1, #0x13
	ldrsb r1, [r2, r1]
	ldrb r0, [r3, #0x13]
	strb r0, [r2, #0x13]
	strb r1, [r3, #0x13]
	movs r1, #0x14
	ldrsb r1, [r2, r1]
	ldrb r0, [r3, #0x14]
	strb r0, [r2, #0x14]
	strb r1, [r3, #0x14]
	movs r1, #0x15
	ldrsb r1, [r2, r1]
	ldrb r0, [r3, #0x15]
	strb r0, [r2, #0x15]
	strb r1, [r3, #0x15]
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	ldrb r0, [r3, #0x16]
	strb r0, [r2, #0x16]
	strb r1, [r3, #0x16]
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	ldrb r0, [r3, #0x17]
	strb r0, [r2, #0x17]
	strb r1, [r3, #0x17]
	movs r1, #0x18
	ldrsb r1, [r2, r1]
	ldrb r0, [r3, #0x18]
	strb r0, [r2, #0x18]
	strb r1, [r3, #0x18]
	movs r1, #0x19
	ldrsb r1, [r2, r1]
	ldrb r0, [r3, #0x19]
	strb r0, [r2, #0x19]
	strb r1, [r3, #0x19]
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	ldrb r0, [r3, #0x1a]
	strb r0, [r2, #0x1a]
	strb r1, [r3, #0x1a]
	movs r1, #0x1d
	ldrsb r1, [r2, r1]
	ldrb r0, [r3, #0x1d]
	strb r0, [r2, #0x1d]
	strb r1, [r3, #0x1d]
	ldrh r1, [r2, #0x1e]
	ldrh r0, [r3, #0x1e]
	strh r0, [r2, #0x1e]
	strh r1, [r3, #0x1e]
	ldrh r1, [r2, #0x20]
	ldrh r0, [r3, #0x20]
	strh r0, [r2, #0x20]
	strh r1, [r3, #0x20]
	ldrh r1, [r2, #0x22]
	ldrh r0, [r3, #0x22]
	strh r0, [r2, #0x22]
	strh r1, [r3, #0x22]
	ldrh r1, [r2, #0x24]
	ldrh r0, [r3, #0x24]
	strh r0, [r2, #0x24]
	strh r1, [r3, #0x24]
	ldrh r1, [r2, #0x26]
	ldrh r0, [r3, #0x26]
	strh r0, [r2, #0x26]
	strh r1, [r3, #0x26]
_08028816:
	pop {r0}
	bx r0
	.align 2, 0

