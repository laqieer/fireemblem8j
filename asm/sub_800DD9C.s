	.syntax unified
	.section .text.sub_800DD9C, "ax", %progbits
@ Event0E_STAL @ JP 0x0800DD9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Event0E_STAL
	.thumb_func
Event0E_STAL:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, [r4, #0x38]
	ldrb r0, [r7]
	movs r1, #0xf
	ands r1, r0
	adds r3, r1, #0
	ldrh r6, [r4, #0x3c]
	lsls r2, r6, #0x10
	lsrs r0, r2, #0x12
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	bne _0800DE20
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0800DDD6
	lsrs r0, r2, #0x13
	ands r0, r5
	cmp r0, #0
	bne _0800DE20
	ldr r0, _0800DDE4 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800DE20
_0800DDD6:
	movs r0, #0x3e
	ldrsh r2, [r4, r0]
	cmp r2, #0
	bgt _0800DDE8
	ldrh r0, [r7, #2]
	strh r0, [r4, #0x3e]
	b _0800DE32
	.align 2, 0
_0800DDE4: .4byte 0x085775CC
_0800DDE8:
	movs r5, #1
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	bne _0800DE16
	movs r0, #2
	ands r3, r0
	cmp r3, #0
	beq _0800DE16
	ldr r0, _0800DE28 @ =0x0202BCEC
	adds r0, #0x40
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #0
	bne _0800DE14
	ldr r0, _0800DE2C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0800DE16
_0800DE14:
	movs r5, #4
_0800DE16:
	subs r0, r2, r5
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bgt _0800DE30
_0800DE20:
	movs r0, #0
	strh r0, [r4, #0x3e]
	b _0800DE34
	.align 2, 0
_0800DE28: .4byte 0x0202BCEC
_0800DE2C: .4byte 0x085775CC
_0800DE30:
	strh r2, [r4, #0x3e]
_0800DE32:
	movs r0, #3
_0800DE34:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

