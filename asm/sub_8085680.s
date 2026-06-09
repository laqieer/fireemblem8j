	.syntax unified
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8085680, "ax", %progbits
@ sub_8085680 @ JP 0x08085680 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085680
	.thumb_func
sub_8085680:
	push {r4, r5, lr}
	ldr r5, _080856A8 @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterEventDataPointer
	adds r4, r0, #0
	bl sub_80C1E74
	adds r1, r0, #0
	cmp r1, #2
	beq _080856B0
	ldrb r1, [r5, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080856AC
	ldr r0, [r4, #0x2c]
	b _080856E0
	.align 2, 0
_080856A8: .4byte 0x0202BCEC
_080856AC:
	ldr r0, [r4, #0x28]
	b _080856E0
_080856B0:
	ldr r1, _080856CC @ =0x03005270
	adds r2, r1, #0
	adds r2, #0xcc
	adds r1, #0xc9
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r1, [r1]
	cmp r1, #1
	beq _080856DA
	cmp r1, #1
	bgt _080856D0
	cmp r1, #0
	beq _080856D6
	b _080856E0
	.align 2, 0
_080856CC: .4byte 0x03005270
_080856D0:
	cmp r1, #2
	beq _080856DE
	b _080856E0
_080856D6:
	ldr r0, [r4, #0x30]
	b _080856E0
_080856DA:
	ldr r0, [r4, #0x34]
	b _080856E0
_080856DE:
	ldr r0, [r4, #0x38]
_080856E0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

