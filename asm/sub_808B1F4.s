	.syntax unified
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8003EC8, 0x08003EC8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_804F5F8, 0x0804F5F8 + 1
	.set sub_804F604, 0x0804F604 + 1
	.set sub_808B438, 0x0808B438 + 1
	.set sub_808B54C, 0x0808B54C + 1
	.set sub_808C40C, 0x0808C40C + 1
	.set sub_808C428, 0x0808C428 + 1
	.section .text.sub_808B1F4, "ax", %progbits
@ sub_808B1F4 @ JP 0x0808B1F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B1F4
	.thumb_func
sub_808B1F4:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r6, r1, #0
	mov sb, r2
	ldr r0, _0808B2A0 @ =0x08A72B50
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
	cmp r7, #0
	bge _0808B22A
	cmp r6, #0
	bge _0808B22A
	bl sub_804F5F8
	adds r7, r0, #0
	bl sub_804F604
	adds r6, r0, #0
_0808B22A:
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r2, r5, #0
	adds r2, #0x4a
	movs r0, #0xc
	strh r0, [r2]
	movs r0, #0x4e
	adds r0, r0, r5
	mov r8, r0
	strh r1, [r0]
	adds r4, r5, #0
	adds r4, #0x4c
	mov r1, sb
	strh r1, [r4]
	movs r0, #1
	bl SetTextFontGlyphs
	ldrh r0, [r4]
	bl sub_8009FA8
	add r2, sp, #4
	mov r1, sp
	bl sub_8003EC8
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	bl sub_808B54C
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl sub_808B438
	adds r1, r7, #0
	adds r1, #8
	strh r1, [r5, #0x38]
	adds r0, r6, #0
	adds r0, #8
	strh r0, [r5, #0x3a]
	strh r1, [r5, #0x3c]
	strh r0, [r5, #0x3e]
	bl sub_808C428
	mov r1, r8
	ldrh r0, [r1]
	ldrh r1, [r4]
	bl sub_808C40C
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B2A0: .4byte 0x08A72B50

