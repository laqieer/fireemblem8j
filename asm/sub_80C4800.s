	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80C6134, 0x080C6134 + 1
	.section .text.sub_80C4800, "ax", %progbits
@ sub_80C4800 @ JP 0x080C4800 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4800
	.thumb_func
sub_80C4800:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, _080C4824 @ =0x03005270
	adds r0, #0x29
	ldrb r2, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C482C
	lsls r0, r2, #5
	ldr r1, _080C4828 @ =0x081F5D7C
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	b _080C4834
	.align 2, 0
_080C4824: .4byte 0x03005270
_080C4828: .4byte 0x081F5D7C
_080C482C:
	lsls r0, r2, #5
	ldr r1, _080C4850 @ =0x081F5D7C
	adds r0, r0, r1
	ldrb r0, [r0, #3]
_080C4834:
	lsls r0, r0, #4
	ldr r1, _080C4854 @ =0x081F5C6C
	adds r6, r0, r1
	movs r0, #0xa
	ldrsb r0, [r6, r0]
	cmp r0, #0x10
	beq _080C4858
	cmp r0, #0x10
	ble _080C484A
	cmp r0, #0x20
	beq _080C485C
_080C484A:
	movs r1, #0
	b _080C485E
	.align 2, 0
_080C4850: .4byte 0x081F5D7C
_080C4854: .4byte 0x081F5C6C
_080C4858:
	movs r1, #1
	b _080C485E
_080C485C:
	movs r1, #2
_080C485E:
	adds r0, r5, #0
	bl sub_80C6134
	adds r3, r0, #0
	adds r3, #0x29
	ldrb r1, [r3]
	movs r2, #1
	orrs r1, r2
	strb r1, [r3]
	adds r5, #0x29
	ldrb r3, [r5]
	lsls r3, r3, #5
	ldr r4, _080C48C4 @ =0x081F5D7C
	adds r3, r3, r4
	movs r1, #0xa
	ldrsb r1, [r6, r1]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	movs r2, #8
	ldrsb r2, [r6, r2]
	subs r1, r1, r2
	ldrh r3, [r3, #0x18]
	adds r1, r1, r3
	strh r1, [r0, #0x2c]
	ldrb r3, [r5]
	lsls r3, r3, #5
	adds r3, r3, r4
	movs r1, #0xb
	ldrsb r1, [r6, r1]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	movs r2, #9
	ldrsb r2, [r6, r2]
	subs r1, r1, r2
	ldrh r3, [r3, #0x1a]
	adds r1, r1, r3
	strh r1, [r0, #0x2e]
	ldr r0, _080C48C8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080C48BE
	ldr r0, _080C48CC @ =0x00000311
	bl m4aSongNumStart
_080C48BE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C48C4: .4byte 0x081F5D7C
_080C48C8: .4byte 0x0202BCEC
_080C48CC: .4byte 0x00000311

