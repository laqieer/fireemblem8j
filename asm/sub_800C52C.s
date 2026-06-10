	.syntax unified
	.set sub_80C48D0, 0x080C48D0 + 1
	.section .text.sub_800C52C, "ax", %progbits
@ sub_800C52C @ JP 0x0800C52C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C52C
	.thumb_func
sub_800C52C:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7, #0x38]
	ldr r1, [r0, #4]
	movs r4, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0800C598 @ =0x081F6340
	adds r5, r0, r1
	movs r3, #4
	ldrsb r3, [r5, r3]
	ldr r2, _0800C59C @ =0x03005270
	lsls r0, r3, #2
	adds r0, r0, r2
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _0800C578
	adds r5, #4
	movs r6, #1
_0800C55C:
	adds r4, #1
	cmp r4, #1
	bgt _0800C5AA
	adds r0, r5, r4
	movs r3, #0
	ldrsb r3, [r0, r3]
	lsls r0, r3, #2
	adds r0, r0, r2
	adds r0, #0x30
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0800C55C
_0800C578:
	cmp r4, #1
	bgt _0800C5AA
	ldrh r0, [r7, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C5A0
	lsls r0, r3, #2
	add r0, ip
	adds r0, #0x30
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	b _0800C5AA
	.align 2, 0
_0800C598: .4byte 0x081F6340
_0800C59C: .4byte 0x03005270
_0800C5A0:
	adds r0, r3, #0
	movs r1, #0
	movs r2, #0
	bl sub_80C48D0
_0800C5AA:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

