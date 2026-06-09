	.syntax unified
	.set sub_802EAC4, 0x0802EAC4 + 1
	.set sub_80860E8, 0x080860E8 + 1
	.set sub_80860F0, 0x080860F0 + 1
	.set sub_80860F4, 0x080860F4 + 1
	.set sub_80860FC, 0x080860FC + 1
	.set sub_80AAE20, 0x080AAE20 + 1
	.section .text.sub_80AAE88, "ax", %progbits
@ sub_80AAE88 @ JP 0x080AAE88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AAE88
	.thumb_func
sub_80AAE88:
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _080AAF50 @ =0x0202BE48
	movs r5, #0x32
_080AAE90:
	ldr r0, [r4]
	cmp r0, #0
	beq _080AAEA8
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl sub_80AAE20
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080AAEA8:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080AAE90
	ldr r4, _080AAF54 @ =0x0202CFB8
	movs r5, #0x31
_080AAEB4:
	ldr r0, [r4]
	cmp r0, #0
	beq _080AAECC
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl sub_80AAE20
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080AAECC:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080AAEB4
	ldr r4, _080AAF58 @ =0x0202DDC8
	movs r5, #9
_080AAED8:
	ldr r0, [r4]
	cmp r0, #0
	beq _080AAEF0
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl sub_80AAE20
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080AAEF0:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080AAED8
	bl sub_80860E8
	adds r4, r0, #0
	bl sub_80860F0
	adds r1, r0, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	bl sub_80AAE20
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl sub_80860F4
	adds r4, r0, #0
	bl sub_80860FC
	adds r1, r0, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	bl sub_80AAE20
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0
	bl sub_802EAC4
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_80AAE20
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080AAF50: .4byte 0x0202BE48
_080AAF54: .4byte 0x0202CFB8
_080AAF58: .4byte 0x0202DDC8

