	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set SetHelpBoxInitPosition, 0x0808B528 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8003EC8, 0x08003EC8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_808B438, 0x0808B438 + 1
	.set sub_808B49C, 0x0808B49C + 1
	.set sub_808B54C, 0x0808B54C + 1
	.set sub_808C40C, 0x0808C40C + 1
	.set sub_808C428, 0x0808C428 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_808B128, "ax", %progbits
@ sub_808B128 @ JP 0x0808B128 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B128
	.thumb_func
sub_808B128:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r6, _0808B160 @ =0x08A72B50
	adds r0, r6, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	bne _0808B164
	adds r0, r6, #0
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	adds r0, #0x52
	strb r7, [r0]
	ldrb r1, [r5, #0x10]
	ldrb r2, [r5, #0x11]
	adds r0, r4, #0
	bl SetHelpBoxInitPosition
	adds r0, r4, #0
	bl sub_808B54C
	b _0808B17C
	.align 2, 0
_0808B160: .4byte 0x08A72B50
_0808B164:
	ldrh r0, [r4, #0x30]
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x32]
	strh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x34]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	ldrh r0, [r4, #0x36]
	adds r1, r4, #0
	adds r1, #0x42
	strh r0, [r1]
_0808B17C:
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r2, r4, #0
	adds r2, #0x4a
	movs r0, #0xc
	strh r0, [r2]
	adds r7, r4, #0
	adds r7, #0x4e
	strh r1, [r7]
	ldrh r0, [r5, #0x12]
	adds r6, r4, #0
	adds r6, #0x4c
	strh r0, [r6]
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x18]
	cmp r1, #0
	beq _0808B1AA
	adds r0, r4, #0
	bl sub_80D65C0
_0808B1AA:
	movs r0, #1
	bl SetTextFontGlyphs
	ldrh r0, [r6]
	bl sub_8009FA8
	add r2, sp, #4
	mov r1, sp
	bl sub_8003EC8
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl sub_808B438
	ldrb r1, [r5, #0x10]
	ldrb r2, [r5, #0x11]
	adds r0, r4, #0
	bl sub_808B49C
	bl sub_808C428
	ldrh r0, [r7]
	ldrh r1, [r6]
	bl sub_808C40C
	ldr r0, _0808B1F0 @ =0x0203E780
	str r5, [r0]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B1F0: .4byte 0x0203E780

