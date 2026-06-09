	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80040B8, 0x080040B8 + 1
	.section .text.sub_808C168, "ax", %progbits
@ sub_808C168 @ JP 0x0808C168 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C168
	.thumb_func
sub_808C168:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0808C1F6
	adds r0, r4, #0
	adds r0, #0x60
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, [r4, #0x30]
	bl SetTextFont
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x62
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r6, r1
	bge _0808C1F0
	adds r5, r4, #0
	adds r5, #0x5c
_0808C19E:
	ldr r0, [r4, #0x2c]
	ldrb r2, [r0]
	adds r3, r0, #0
	cmp r2, #1
	beq _0808C1C0
	cmp r2, #1
	bgt _0808C1B2
	cmp r2, #0
	beq _0808C1B8
	b _0808C1D0
_0808C1B2:
	cmp r2, #4
	beq _0808C1CC
	b _0808C1D0
_0808C1B8:
	adds r0, r4, #0
	bl sub_8002DE4
	b _0808C1F0
_0808C1C0:
	adds r0, r3, #1
	str r0, [r4, #0x2c]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _0808C1E6
_0808C1CC:
	adds r0, r3, #1
	b _0808C1E4
_0808C1D0:
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r3, #0
	bl sub_80040B8
_0808C1E4:
	str r0, [r4, #0x2c]
_0808C1E6:
	adds r6, #1
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r6, r0
	blt _0808C19E
_0808C1F0:
	movs r0, #0
	bl SetTextFont
_0808C1F6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

