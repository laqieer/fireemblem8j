	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_80040B8, 0x080040B8 + 1
	.section .text.sub_808C1FC, "ax", %progbits
@ sub_808C1FC @ JP 0x0808C1FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C1FC
	.thumb_func
sub_808C1FC:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	bl SetTextFont
	movs r6, #0
_0808C208:
	lsls r1, r6, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r5, [r0]
	ldrb r0, [r5, #4]
	lsls r0, r0, #3
	ldr r1, [r4, #0x2c]
	bl sub_8003EAC
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8003D84
_0808C224:
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0]
	cmp r1, #1
	beq _0808C244
	cmp r1, #1
	bgt _0808C236
	cmp r1, #0
	beq _0808C25C
	b _0808C250
_0808C236:
	cmp r1, #5
	bgt _0808C250
	cmp r1, #4
	blt _0808C250
	adds r0, #1
	str r0, [r4, #0x2c]
	b _0808C224
_0808C244:
	adds r0, #1
	str r0, [r4, #0x2c]
	adds r6, #1
	cmp r6, #5
	ble _0808C208
	b _0808C25C
_0808C250:
	ldr r1, [r4, #0x2c]
	adds r0, r5, #0
	bl sub_80040B8
	str r0, [r4, #0x2c]
	b _0808C224
_0808C25C:
	ldr r0, [r4, #0x30]
	bl SetTextFont
	pop {r4, r5, r6}
	pop {r0}
	bx r0

