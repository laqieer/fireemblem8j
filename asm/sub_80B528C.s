	.syntax unified
	.set GetChapterTitleExtra, 0x0808BA78 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_808B824, 0x0808B824 + 1
	.set sub_808B894, 0x0808B894 + 1
	.set sub_808B93C, 0x0808B93C + 1
	.section .text.sub_80B528C, "ax", %progbits
@ sub_80B528C @ JP 0x080B528C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B528C
	.thumb_func
sub_80B528C:
	push {r4, lr}
	ldr r2, _080B52CC @ =0x0202BCEC
	ldrb r1, [r2, #0x14]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r4, r0, #0x1f
	movs r0, #4
	ands r4, r0
	adds r0, r2, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _080B52D0
	ldrb r1, [r2, #0x1b]
	cmp r1, #1
	bne _080B52BA
	movs r0, #0x10
	orrs r4, r0
_080B52BA:
	cmp r1, #2
	bne _080B52C2
	movs r0, #0x20
	orrs r4, r0
_080B52C2:
	cmp r1, #3
	bne _080B52DA
_080B52C6:
	orrs r4, r3
	b _080B52DA
	.align 2, 0
_080B52CC: .4byte 0x0202BCEC
_080B52D0:
	ldrb r0, [r2, #0x1b]
	cmp r0, #3
	beq _080B52C6
	movs r0, #0x20
	orrs r4, r0
_080B52DA:
	movs r0, #1
	orrs r0, r4
	movs r1, #0x18
	bl sub_808B824
	adds r0, r4, #0
	movs r1, #0x19
	bl sub_808B824
	bl sub_8001EE4
	movs r0, #0xac
	lsls r0, r0, #4
	bl sub_808B93C
	movs r4, #0xb4
	lsls r4, r4, #4
	ldr r0, _080B5310 @ =0x0202BCEC
	bl GetChapterTitleExtra
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_808B894
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5310: .4byte 0x0202BCEC

