	.syntax unified
	.set __modsi3, 0x080D6690 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_80936B0, "ax", %progbits
@ sub_80936B0 @ JP 0x080936B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80936B0
	.thumb_func
sub_80936B0:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r2, r1, #0
	ldr r0, [r6]
	ldr r1, [r6, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080936E4
	ldr r0, _080936E0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809373A
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809373A
	.align 2, 0
_080936E0: .4byte 0x0202BCEC
_080936E4:
	ldr r4, [r6, #0xc]
	movs r5, #0xc0
	lsls r5, r5, #8
	adds r0, r4, #0
	ands r0, r5
	lsrs r1, r0, #0xe
	adds r0, r1, r2
	adds r0, #3
	movs r1, #3
	bl __modsi3
	lsls r1, r0, #0xe
	ldr r0, _08093720 @ =0xFFFF3FFF
	ands r4, r0
	orrs r4, r1
	str r4, [r6, #0xc]
	ands r1, r5
	cmp r1, #0
	beq _08093728
	ldr r0, _08093724 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809373A
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0809373A
	.align 2, 0
_08093720: .4byte 0xFFFF3FFF
_08093724: .4byte 0x0202BCEC
_08093728:
	ldr r0, _08093740 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809373A
	movs r0, #0x6b
	bl m4aSongNumStart
_0809373A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093740: .4byte 0x0202BCEC

