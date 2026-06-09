	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8068738, 0x08068738 + 1
	.section .text.sub_806845C, "ax", %progbits
@ sub_806845C @ JP 0x0806845C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806845C
	.thumb_func
sub_806845C:
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	movs r1, #0
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _0806847E
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xc8
	b _080685C0
_0806847E:
	cmp r0, #0xa
	bne _08068494
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x43
	movs r3, #0x5b
	bl sub_8068738
	b _080685F4
_08068494:
	cmp r0, #0xf
	bne _080684AA
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xd
	movs r3, #0x59
	bl sub_8068738
	b _080685F4
_080684AA:
	cmp r0, #0x14
	bne _080684C0
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xcb
	movs r3, #0x4c
	bl sub_8068738
	b _080685F4
_080684C0:
	cmp r0, #0x19
	bne _080684D6
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xdf
	movs r3, #2
	bl sub_8068738
	b _080685F4
_080684D6:
	cmp r0, #0x1e
	bne _080684EC
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xe
	movs r3, #0x6f
	bl sub_8068738
	b _080685F4
_080684EC:
	cmp r0, #0x23
	bne _08068502
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xe0
	movs r3, #0x6c
	bl sub_8068738
	b _080685F4
_08068502:
	cmp r0, #0x28
	bne _08068514
	ldr r0, [r2, #0x5c]
	movs r2, #0xb8
	lsls r2, r2, #1
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	b _080685C0
_08068514:
	cmp r0, #0x2d
	bne _08068528
	ldr r0, [r2, #0x5c]
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x3a
	movs r3, #0x2d
	bl sub_8068738
	b _080685F4
_08068528:
	cmp r0, #0x32
	bne _08068536
	ldr r0, [r2, #0x5c]
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x7f
	b _0806858A
_08068536:
	movs r0, #0x2c
	ldrsh r1, [r2, r0]
	cmp r1, #0x37
	bne _08068550
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xa3
	movs r3, #0x14
	bl sub_8068738
	b _080685F4
_08068550:
	cmp r1, #0x3c
	bne _08068566
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xa7
	movs r3, #0x3e
	bl sub_8068738
	b _080685F4
_08068566:
	cmp r1, #0x41
	bne _0806857C
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x38
	movs r3, #0x60
	bl sub_8068738
	b _080685F4
_0806857C:
	cmp r1, #0x46
	bne _08068592
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x80
_0806858A:
	movs r3, #0x42
	bl sub_8068738
	b _080685F4
_08068592:
	cmp r1, #0x4b
	bne _080685A2
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x38
	b _080685C0
_080685A2:
	cmp r1, #0x50
	bne _080685B2
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xa8
	b _080685C0
_080685B2:
	cmp r1, #0x55
	bne _080685C8
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xa4
_080685C0:
	movs r3, #0x70
	bl sub_8068738
	b _080685F4
_080685C8:
	cmp r1, #0x5a
	bne _080685DE
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x41
	movs r3, #0x78
	bl sub_8068738
	b _080685F4
_080685DE:
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _080685F4
	ldr r1, _080685FC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl sub_8002DE4
_080685F4:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080685FC: .4byte 0x0201774C

