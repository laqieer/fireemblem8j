	.syntax unified
	.set sub_802B03C, 0x0802B03C + 1
	.section .text.sub_802B4CC, "ax", %progbits
@ sub_802B4CC @ JP 0x0802B4CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802B4CC
	.thumb_func
sub_802B4CC:
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0xc0
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0802B540
	ldr r4, _0802B548 @ =0x0203A4D0
	ldrb r1, [r4, #2]
	cmp r1, #1
	bne _0802B540
	ldr r5, _0802B54C @ =0x0203A604
	ldr r0, [r5]
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	ands r0, r1
	cmp r0, #0
	beq _0802B540
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq _0802B540
	ldrh r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0802B540
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_802B03C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B540
	ldr r3, [r5]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	ldr r0, _0802B550 @ =0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	movs r0, #0x64
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xa]
_0802B540:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B548: .4byte 0x0203A4D0
_0802B54C: .4byte 0x0203A604
_0802B550: .4byte 0xFFF80000

