	.syntax unified
	.section .text.sub_800D860, "ax", %progbits
@ sub_800D860 @ JP 0x0800D860 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D860
	.thumb_func
sub_800D860:
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x3c]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800D90C
	ldr r0, [r3, #0x38]
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	ldr r6, _0800D8D0 @ =0x03000568
	cmp r0, #1
	bne _0800D896
	movs r4, #0
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r1, r6, #0
	adds r5, r2, #0
_0800D886:
	str r4, [r1]
	str r4, [r1, #4]
	adds r0, r2, #0
	adds r2, r2, r5
	adds r1, #8
	asrs r0, r0, #0x18
	cmp r0, #7
	ble _0800D886
_0800D896:
	ldr r0, [r6]
	cmp r0, #0
	beq _0800D8D4
	str r0, [r3, #0x34]
	ldr r0, [r6, #4]
	str r0, [r3, #0x38]
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r1, r6, #0
	adds r3, r2, #0
_0800D8AA:
	ldr r0, [r1, #8]
	str r0, [r1]
	ldr r0, [r1, #0xc]
	str r0, [r1, #4]
	adds r0, r2, #0
	adds r2, r2, r3
	adds r1, #8
	asrs r0, r0, #0x18
	cmp r0, #6
	ble _0800D8AA
	movs r2, #0
	lsls r0, r0, #3
	adds r1, r0, r6
	str r2, [r1]
	adds r1, r6, #4
	adds r0, r0, r1
	str r2, [r0]
	movs r0, #0
	b _0800D90E
	.align 2, 0
_0800D8D0: .4byte 0x03000568
_0800D8D4:
	adds r2, r3, #0
	adds r2, #0x41
	ldrb r0, [r2]
	cmp r0, #0
	beq _0800D8E4
	cmp r0, #1
	beq _0800D8EA
	b _0800D90C
_0800D8E4:
	movs r0, #4
	strb r0, [r2]
	b _0800D90C
_0800D8EA:
	ldrh r1, [r3, #0x3c]
	ldr r0, _0800D904 @ =0x0000FFFB
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #5
	strb r0, [r2]
	ldr r0, _0800D908 @ =0x085B9EF8
	str r0, [r3, #0x34]
	str r0, [r3, #0x38]
	movs r0, #1
	b _0800D90E
	.align 2, 0
_0800D904: .4byte 0x0000FFFB
_0800D908: .4byte 0x085B9EF8
_0800D90C:
	movs r0, #5
_0800D90E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

