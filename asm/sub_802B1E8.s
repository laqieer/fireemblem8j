	.syntax unified
	.set sub_802A490, 0x0802A490 + 1
	.section .text.sub_802B1E8, "ax", %progbits
@ sub_802B1E8 @ JP 0x0802B1E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802B1E8
	.thumb_func
sub_802B1E8:
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r5, _0802B250 @ =0x0203A604
	ldr r0, [r5]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r1, r0, #0xd
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0802B24A
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r1, #0
	ands r0, r4
	cmp r0, #0
	bne _0802B24A
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne _0802B24A
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x24
	bgt _0802B24A
	cmp r0, #0x23
	blt _0802B24A
	movs r0, #8
	ldrsb r0, [r2, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl sub_802A490
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802B24A
	ldr r3, [r5]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	orrs r1, r4
	ldr r0, _0802B254 @ =0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_0802B24A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B250: .4byte 0x0203A604
_0802B254: .4byte 0xFFF80000

