	.syntax unified
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.set sub_800D340, 0x0800D340 + 1
	.section .text.sub_808618C, "ax", %progbits
@ sub_808618C @ JP 0x0808618C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808618C
	.thumb_func
sub_808618C:
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _080861D4 @ =0x0202BCEC
	adds r6, r1, #0
	adds r6, #0x4b
	ldrb r0, [r6]
	cmp r0, #0
	beq _080861D8
	adds r5, r1, #0
	adds r5, #0x4a
	ldrb r0, [r5]
	lsrs r0, r0, #4
	cmp r0, r2
	bne _080861D8
	ldrb r4, [r6]
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetChapterEventDataPointer
	ldr r0, [r0, #0x1c]
	lsls r4, r4, #2
	adds r4, r4, r0
	subs r4, #4
	ldr r0, [r4]
	movs r1, #1
	bl sub_800D340
	movs r0, #0
	strb r0, [r6]
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	strb r0, [r5]
	movs r0, #1
	b _080861DA
	.align 2, 0
_080861D4: .4byte 0x0202BCEC
_080861D8:
	movs r0, #0
_080861DA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

