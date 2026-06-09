	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set sub_802A490, 0x0802A490 + 1
	.section .text.sub_802B164, "ax", %progbits
@ sub_802B164 @ JP 0x0802B164 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802B164
	.thumb_func
sub_802B164:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _0802B1E0 @ =0x0203A604
	ldr r0, [r6]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r1, r0, #0xd
	movs r5, #0x80
	lsls r5, r5, #7
	adds r0, r1, #0
	ands r0, r5
	cmp r0, #0
	bne _0802B1D8
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0802B1D8
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne _0802B1D8
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x1c
	bgt _0802B1D8
	cmp r0, #0x1b
	blt _0802B1D8
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x37
	bgt _0802B1B0
	cmp r0, #0x35
	bge _0802B1D8
_0802B1B0:
	movs r0, #8
	ldrsb r0, [r4, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl sub_802A490
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802B1D8
	ldr r3, [r6]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	orrs r1, r5
	ldr r0, _0802B1E4 @ =0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_0802B1D8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802B1E0: .4byte 0x0203A604
_0802B1E4: .4byte 0xFFF80000

