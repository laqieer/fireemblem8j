	.syntax unified
	.set IsDifficultMode, 0x0803460C + 1
	.section .text.sub_80BACC8, "ax", %progbits
@ sub_80BACC8 @ JP 0x080BACC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BACC8
	.thumb_func
sub_80BACC8:
	push {r4, r5, lr}
	sub sp, #0x10
	ldr r0, _080BAD40 @ =0x0202BCEC
	ldrh r5, [r0, #0x10]
	movs r1, #0xe
	ldrsb r1, [r0, r1]
	movs r0, #0x94
	muls r1, r0, r1
	ldr r0, _080BAD44 @ =0x08904E1C
	adds r4, r1, r0
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x39
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp]
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x35
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp, #4]
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x31
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp, #8]
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x2d
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [sp, #0xc]
	movs r2, #0
	mov r1, sp
_080BAD28:
	ldr r0, [r1]
	cmp r5, r0
	bgt _080BAD36
	adds r1, #4
	adds r2, #1
	cmp r2, #3
	ble _080BAD28
_080BAD36:
	adds r0, r2, #0
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BAD40: .4byte 0x0202BCEC
_080BAD44: .4byte 0x08904E1C

