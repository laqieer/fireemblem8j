	.syntax unified
	.set sub_808B894, 0x0808B894 + 1
	.set sub_808B93C, 0x0808B93C + 1
	.section .text.sub_80AD4B4, "ax", %progbits
@ sub_80AD4B4 @ JP 0x080AD4B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AD4B4
	.thumb_func
sub_80AD4B4:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0xac
	lsls r0, r0, #4
	bl sub_808B93C
	movs r4, #0
	ldr r6, _080AD4E4 @ =0x0001FFFF
	movs r5, #0xb4
	lsls r5, r5, #9
_080AD4C8:
	adds r0, r7, #0
	adds r0, #0x37
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080AD4E8
	adds r0, r5, #0
	ands r0, r6
	lsrs r0, r0, #5
	ldrb r1, [r1]
	bl sub_808B894
	b _080AD4F6
	.align 2, 0
_080AD4E4: .4byte 0x0001FFFF
_080AD4E8:
	adds r0, r5, #0
	ands r0, r6
	lsrs r0, r0, #5
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_808B894
_080AD4F6:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #2
	ble _080AD4C8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

