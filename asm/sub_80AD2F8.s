	.syntax unified
	.set sub_808B1F4, 0x0808B1F4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.section .text.sub_80AD2F8, "ax", %progbits
@ sub_80AD2F8 @ JP 0x080AD2F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AD2F8
	.thumb_func
sub_80AD2F8:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080AD30E
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r1, [r0]
	cmp r1, #0
	bne _080AD31C
_080AD30E:
	bl sub_808B2A4
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0
	strb r0, [r1]
	b _080AD358
_080AD31C:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r1, [r1]
	cmp r1, #0x10
	beq _080AD334
	cmp r1, #0x10
	bgt _080AD330
	cmp r1, #2
	beq _080AD334
	b _080AD358
_080AD330:
	cmp r1, #0x20
	bne _080AD358
_080AD334:
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AD358
	adds r4, #0x3e
	ldrb r0, [r4]
	cmp r0, #0
	bne _080AD358
	ldr r0, _080AD360 @ =0x06014000
	movs r1, #9
	bl sub_808BB14
	ldr r2, _080AD364 @ =0x00000701
	movs r0, #0x30
	movs r1, #0x30
	bl sub_808B1F4
	movs r0, #1
	strb r0, [r4]
_080AD358:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD360: .4byte 0x06014000
_080AD364: .4byte 0x00000701

