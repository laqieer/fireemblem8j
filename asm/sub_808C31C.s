	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_800A004, 0x0800A004 + 1
	.section .text.sub_808C31C, "ax", %progbits
@ sub_808C31C @ JP 0x0808C31C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C31C
	.thumb_func
sub_808C31C:
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	mov sl, r0
	ldr r5, _0808C3C4 @ =0x0203E790
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	movs r0, #0x18
	adds r0, r0, r5
	mov sb, r0
	movs r1, #6
	bl sub_8003D90
	movs r1, #0x20
	adds r1, r1, r5
	mov r8, r1
	mov r0, r8
	movs r1, #6
	bl sub_8003D90
	adds r6, r5, #0
	adds r6, #0x28
	adds r0, r6, #0
	movs r1, #6
	bl sub_8003D90
	movs r0, #0
	bl SetTextFont
	ldr r4, _0808C3C8 @ =0x08A736E0
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x30]
	mov r0, sb
	str r0, [r4, #0x34]
	mov r1, r8
	str r1, [r4, #0x38]
	str r6, [r4, #0x3c]
	mov r0, sl
	adds r0, #0x64
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5c
	movs r5, #0
	strh r1, [r0]
	mov r1, sl
	ldr r0, [r1, #0x5c]
	bl sub_8009FA8
	bl sub_800A004
	str r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x62
	movs r3, #1
	strh r3, [r1]
	adds r0, r4, #0
	adds r0, #0x5e
	strh r5, [r0]
	ldr r0, _0808C3CC @ =0x0202BCEC
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r2, r0, #0x1e
	cmp r2, #1
	beq _0808C3E2
	cmp r2, #1
	bgt _0808C3D0
	cmp r2, #0
	beq _0808C3DA
	b _0808C3FE
	.align 2, 0
_0808C3C4: .4byte 0x0203E790
_0808C3C8: .4byte 0x08A736E0
_0808C3CC: .4byte 0x0202BCEC
_0808C3D0:
	cmp r2, #2
	beq _0808C3EA
	cmp r2, #3
	beq _0808C3F4
	b _0808C3FE
_0808C3DA:
	adds r1, r4, #0
	adds r1, #0x60
	movs r0, #2
	b _0808C3FC
_0808C3E2:
	adds r0, r4, #0
	adds r0, #0x60
	strh r2, [r0]
	b _0808C3FE
_0808C3EA:
	adds r0, r4, #0
	adds r0, #0x60
	strh r3, [r0]
	strh r2, [r1]
	b _0808C3FE
_0808C3F4:
	adds r0, r4, #0
	adds r0, #0x60
	strh r5, [r0]
	movs r0, #0x7f
_0808C3FC:
	strh r0, [r1]
_0808C3FE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0

