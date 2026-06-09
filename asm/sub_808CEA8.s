	.syntax unified
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8003E6C, 0x08003E6C + 1
	.section .text.sub_808CEA8, "ax", %progbits
@ sub_808CEA8 @ JP 0x0808CEA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808CEA8
	.thumb_func
sub_808CEA8:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r1, #0
	movs r5, #0
	adds r4, r0, #0
	strb r5, [r6]
	movs r0, #1
	bl SetTextFontGlyphs
_0808CEBA:
	ldrb r0, [r4]
	cmp r0, #7
	bgt _0808CEDC
	cmp r0, #4
	bge _0808CEF2
	cmp r0, #1
	beq _0808CEF6
	cmp r0, #1
	bgt _0808CED2
	cmp r0, #0
	beq _0808CF10
	b _0808CF00
_0808CED2:
	cmp r0, #2
	beq _0808CEF2
	cmp r0, #3
	beq _0808CF10
	b _0808CF00
_0808CEDC:
	cmp r0, #0x19
	ble _0808CEE6
	cmp r0, #0x80
	beq _0808CEFC
	b _0808CF00
_0808CEE6:
	cmp r0, #0x18
	bge _0808CEF6
	cmp r0, #0x14
	bgt _0808CF00
	cmp r0, #0x12
	blt _0808CF00
_0808CEF2:
	adds r4, #1
	b _0808CEBA
_0808CEF6:
	adds r4, #1
	movs r5, #0
	b _0808CEBA
_0808CEFC:
	adds r4, #2
	b _0808CEBA
_0808CF00:
	adds r0, r4, #0
	mov r1, sp
	bl sub_8003E6C
	adds r4, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b _0808CEBA
_0808CF10:
	adds r0, r5, #2
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

