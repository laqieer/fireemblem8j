	.syntax unified
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.section .text.sub_8086100, "ax", %progbits
@ sub_8086100 @ JP 0x08086100 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086100
	.thumb_func
sub_8086100:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r4, #0
	ldr r5, _08086140 @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterEventDataPointer
	ldr r1, [r0, #0x1c]
	ldr r0, [r1]
	cmp r0, #0
	beq _08086154
	adds r2, r5, #0
	adds r2, #0x4a
	lsls r3, r6, #4
	adds r5, #0x4b
	movs r6, #0xf
_08086126:
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r7
	bne _08086144
	adds r0, r4, #1
	strb r0, [r5]
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	b _08086154
	.align 2, 0
_08086140: .4byte 0x0202BCEC
_08086144:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _08086126
_08086154:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

