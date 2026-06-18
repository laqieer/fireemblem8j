	.syntax unified
	.section .text.sub_800DE3C, "ax", %progbits
@ Event0F_CounterOps @ JP 0x0800DE3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Event0F_CounterOps
	.thumb_func
Event0F_CounterOps:
	push {r4, r5, r6, r7, lr}
	ldr r0, [r0, #0x38]
	ldrb r1, [r0]
	movs r2, #0xf
	mov ip, r2
	movs r7, #0xf
	adds r2, r7, #0
	ands r2, r1
	adds r5, r2, #0
	ldrh r6, [r0, #2]
	ldrb r0, [r0, #2]
	movs r1, #7
	ands r0, r1
	lsls r4, r0, #2
	cmp r2, #1
	beq _0800DE94
	cmp r2, #1
	bgt _0800DE6C
	cmp r2, #0
	beq _0800DE7C
	ldr r5, _0800DE68 @ =0x03000560
	b _0800DED0
	.align 2, 0
_0800DE68: .4byte 0x03000560
_0800DE6C:
	cmp r5, #2
	beq _0800DEA0
	cmp r5, #3
	beq _0800DEBC
	ldr r5, _0800DE78 @ =0x03000560
	b _0800DED0
	.align 2, 0
_0800DE78: .4byte 0x03000560
_0800DE7C:
	ldr r1, _0800DE8C @ =0x030004B0
	ldr r0, _0800DE90 @ =0x03000560
	ldr r0, [r0]
	lsrs r0, r4
	ands r0, r7
	str r0, [r1, #0x30]
	b _0800DEE2
	.align 2, 0
_0800DE8C: .4byte 0x030004B0
_0800DE90: .4byte 0x03000560
_0800DE94:
	lsls r0, r6, #0x10
	asrs r3, r0, #0x18
	ldr r5, _0800DE9C @ =0x03000560
	b _0800DED0
	.align 2, 0
_0800DE9C: .4byte 0x03000560
_0800DEA0:
	ldr r0, _0800DEB8 @ =0x03000560
	ldr r3, [r0]
	lsrs r3, r4
	mov r1, ip
	ands r3, r1
	adds r3, #1
	adds r5, r0, #0
	cmp r3, #0xf
	ble _0800DED0
	movs r3, #0xf
	b _0800DED0
	.align 2, 0
_0800DEB8: .4byte 0x03000560
_0800DEBC:
	ldr r0, _0800DEEC @ =0x03000560
	ldr r3, [r0]
	lsrs r3, r4
	mov r2, ip
	ands r3, r2
	subs r3, #1
	adds r5, r0, #0
	cmp r3, #0
	bge _0800DED0
	movs r3, #0
_0800DED0:
	movs r0, #0xf
	adds r1, r0, #0
	lsls r1, r4
	ldr r2, [r5]
	bics r2, r1
	ands r3, r0
	lsls r3, r4
	orrs r2, r3
	str r2, [r5]
_0800DEE2:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800DEEC: .4byte 0x03000560

