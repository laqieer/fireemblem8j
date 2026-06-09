	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_8050860, "ax", %progbits
@ sub_8050860 @ JP 0x08050860 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050860
	.thumb_func
sub_8050860:
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	ldr r2, _080508D0 @ =0x085775CC
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	beq _0805087C
	ldr r0, [r3, #4]
	cmp r0, #0
	beq _0805087C
	str r0, [r4, #0x30]
_0805087C:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x90
	ands r0, r1
	cmp r0, #0
	beq _08050892
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _08050892
	str r0, [r4, #0x30]
_08050892:
	ldr r0, [r4, #0x30]
	cmp r0, r3
	beq _080508CA
	ldr r0, [r4, #0x2c]
	ldr r2, [r0, #0x10]
	cmp r2, #0
	beq _080508A8
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_80D65C4
_080508A8:
	ldr r0, [r4, #0x2c]
	ldr r2, [r0, #0xc]
	cmp r2, #0
	beq _080508B8
	ldr r1, [r4, #0x30]
	adds r0, r4, #0
	bl sub_80D65C4
_080508B8:
	ldr r0, _080508D4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080508CA
	movs r0, #0x67
	bl m4aSongNumStart
_080508CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080508D0: .4byte 0x085775CC
_080508D4: .4byte 0x0202BCEC

