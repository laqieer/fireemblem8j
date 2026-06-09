	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_800A004, 0x0800A004 + 1
	.set sub_8030BE4, 0x08030BE4 + 1
	.set sub_808C834, 0x0808C834 + 1
	.set sub_808DC14, 0x0808DC14 + 1
	.section .text.sub_808DC38, "ax", %progbits
@ sub_808DC38 @ JP 0x0808DC38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808DC38
	.thumb_func
sub_808DC38:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0808DCA8 @ =0x0203E7E4
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #1
	bl SetTextFontGlyphs
	bl sub_808C834
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0808DCAC
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #6
	bl sub_8003D90
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #6
	bl sub_8003D90
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #6
	bl sub_8003D90
	bl sub_808C834
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808DCCA
	bl sub_808C834
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _0808DCCA
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #6
	bl sub_8003D90
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #6
	bl sub_8003D90
	b _0808DCCA
	.align 2, 0
_0808DCA8: .4byte 0x0203E7E4
_0808DCAC:
	movs r4, #0
	b _0808DCBE
_0808DCB0:
	lsls r0, r4, #3
	ldr r1, _0808DD48 @ =0x0203E7FC
	adds r0, r0, r1
	movs r1, #0
	bl sub_8003D90
	adds r4, #1
_0808DCBE:
	bl sub_808C834
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0808DCB0
_0808DCCA:
	movs r0, #0
	bl SetTextFont
	ldr r4, _0808DD4C @ =0x08A73818
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	ldr r1, _0808DD50 @ =0x0203E7E4
	str r1, [r4, #0x30]
	adds r0, r1, #0
	adds r0, #0x18
	str r0, [r4, #0x34]
	adds r0, #8
	str r0, [r4, #0x38]
	adds r0, #8
	str r0, [r4, #0x3c]
	adds r0, #8
	str r0, [r4, #0x40]
	adds r0, #8
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x48
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r5, #0x5c]
	bl sub_8009FA8
	bl sub_800A004
	str r0, [r4, #0x2c]
	ldr r1, [r5, #0x2c]
	adds r0, r4, #0
	adds r0, #0x54
	strb r1, [r0]
	ldr r0, [r5, #0x30]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	bl sub_808DC14
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0808DD54
	bl sub_8030BE4
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	lsls r0, r0, #0x10
	movs r1, #0x80
	cmp r0, #0
	beq _0808DD40
	movs r1, #1
_0808DD40:
	adds r0, r4, #0
	adds r0, #0x4e
	strh r1, [r0]
	b _0808DD62
	.align 2, 0
_0808DD48: .4byte 0x0203E7FC
_0808DD4C: .4byte 0x08A73818
_0808DD50: .4byte 0x0203E7E4
_0808DD54:
	adds r0, r4, #0
	adds r0, #0x4c
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x4e
	movs r0, #0x80
	strh r0, [r1]
_0808DD62:
	adds r1, r4, #0
	adds r1, #0x4a
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

