	.syntax unified
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_803E628, "ax", %progbits
@ sub_803E628 @ JP 0x0803E628 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803E628
	.thumb_func
sub_803E628:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_8018E64
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl sub_8018EA4
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_80D6374
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r3, [r5, #0xa]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0803E678
	ldr r2, _0803E674 @ =0x085D2298
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, r4
	bhi _0803E69E
	movs r0, #0xfe
	ands r0, r3
	strb r0, [r5, #0xa]
	movs r0, #0
	b _0803E6A0
	.align 2, 0
_0803E674: .4byte 0x085D2298
_0803E678:
	ldr r2, _0803E694 @ =0x085D2298
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, r4
	bhi _0803E698
	movs r0, #0
	b _0803E6A0
	.align 2, 0
_0803E694: .4byte 0x085D2298
_0803E698:
	movs r0, #1
	orrs r0, r3
	strb r0, [r5, #0xa]
_0803E69E:
	movs r0, #1
_0803E6A0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

