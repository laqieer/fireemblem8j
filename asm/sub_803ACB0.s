	.syntax unified
	.set GetItemMaxRange, 0x0801742C + 1
	.section .text.sub_803ACB0, "ax", %progbits
@ sub_803ACB0 @ JP 0x0803ACB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803ACB0
	.thumb_func
sub_803ACB0:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	movs r3, #0x10
	ldrsb r3, [r4, r3]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	subs r1, r3, r0
	cmp r1, #0
	bge _0803ACCA
	subs r1, r0, r3
_0803ACCA:
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	subs r3, r2, r0
	cmp r3, #0
	blt _0803ACDC
	adds r6, r1, r3
	b _0803ACE0
_0803ACDC:
	subs r0, r0, r2
	adds r6, r1, r0
_0803ACE0:
	adds r0, r7, #0
	bl GetItemMaxRange
	movs r1, #0x1d
	ldrsb r1, [r4, r1]
	ldr r2, [r4, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	movs r2, #0x1d
	ldrsb r2, [r5, r2]
	ldr r3, [r5, #4]
	ldrb r3, [r3, #0x12]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r2, r3
	adds r1, r1, r2
	adds r1, r1, r0
	cmp r6, r1
	ble _0803AD0E
	movs r0, #0
	b _0803AD10
_0803AD0E:
	movs r0, #1
_0803AD10:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

