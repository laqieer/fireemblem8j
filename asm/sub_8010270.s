	.syntax unified
	.set sub_800BF3C, 0x0800BF3C + 1
	.set sub_8018FAC, 0x08018FAC + 1
	.section .text.sub_8010270, "ax", %progbits
@ sub_8010270 @ JP 0x08010270 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010270
	.thumb_func
sub_8010270:
	push {r4, r5, lr}
	ldr r1, [r0, #0x38]
	ldrb r0, [r1]
	movs r4, #0xf
	ands r4, r0
	movs r0, #2
	ldrsh r5, [r1, r0]
	adds r0, r5, #0
	bl sub_800BF3C
	adds r2, r0, #0
	cmp r4, #8
	bls _0801028C
	b _080103E6
_0801028C:
	lsls r0, r4, #2
	ldr r1, _08010298 @ =_0801029C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08010298: .4byte _0801029C
_0801029C: @ jump table
	.4byte _080102C0 @ case 0
	.4byte _080102D0 @ case 1
	.4byte _080102E8 @ case 2
	.4byte _08010318 @ case 3
	.4byte _08010344 @ case 4
	.4byte _08010370 @ case 5
	.4byte _080103A8 @ case 6
	.4byte _080103C0 @ case 7
	.4byte _080103D4 @ case 8
_080102C0:
	cmp r2, #0
	beq _080102EC
	ldr r1, _080102CC @ =0x030004B0
	movs r0, #1
	b _080103E4
	.align 2, 0
_080102CC: .4byte 0x030004B0
_080102D0:
	cmp r2, #0
	bne _080102D6
	b _080103D8
_080102D6:
	ldr r0, _080102E4 @ =0x030004B0
	ldr r1, [r2]
	adds r1, #0x30
	ldrb r1, [r1]
	str r1, [r0, #0x30]
	b _080103E6
	.align 2, 0
_080102E4: .4byte 0x030004B0
_080102E8:
	cmp r2, #0
	bne _080102F8
_080102EC:
	ldr r0, _080102F4 @ =0x030004B0
	str r2, [r0, #0x30]
	b _080103E6
	.align 2, 0
_080102F4: .4byte 0x030004B0
_080102F8:
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0801030C
	ldr r1, _08010308 @ =0x030004B0
	movs r0, #0
	b _080103E4
	.align 2, 0
_08010308: .4byte 0x030004B0
_0801030C:
	ldr r1, _08010314 @ =0x030004B0
	movs r0, #1
	b _080103E4
	.align 2, 0
_08010314: .4byte 0x030004B0
_08010318:
	cmp r2, #0
	beq _080103D8
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08010330
	ldr r1, _0801032C @ =0x030004B0
	movs r0, #0
	b _080103E4
	.align 2, 0
_0801032C: .4byte 0x030004B0
_08010330:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt _08010390
	ldr r1, _08010340 @ =0x030004B0
	movs r0, #1
	b _080103E4
	.align 2, 0
_08010340: .4byte 0x030004B0
_08010344:
	cmp r2, #0
	beq _080103D8
	ldr r0, _0801035C @ =0x03004DF0
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r5
	beq _08010364
	ldr r1, _08010360 @ =0x030004B0
	movs r0, #0
	b _080103E4
	.align 2, 0
_0801035C: .4byte 0x03004DF0
_08010360: .4byte 0x030004B0
_08010364:
	ldr r1, _0801036C @ =0x030004B0
	movs r0, #1
	b _080103E4
	.align 2, 0
_0801036C: .4byte 0x030004B0
_08010370:
	cmp r2, #0
	beq _080103D8
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	movs r0, #0xc0
	ands r1, r0
	cmp r1, #0
	beq _08010390
	cmp r1, #0x80
	beq _0801039C
	ldr r1, _0801038C @ =0x030004B0
	movs r0, #1
	b _080103E4
	.align 2, 0
_0801038C: .4byte 0x030004B0
_08010390:
	ldr r0, _08010398 @ =0x030004B0
	str r1, [r0, #0x30]
	b _080103E6
	.align 2, 0
_08010398: .4byte 0x030004B0
_0801039C:
	ldr r1, _080103A4 @ =0x030004B0
	movs r0, #2
	b _080103E4
	.align 2, 0
_080103A4: .4byte 0x030004B0
_080103A8:
	cmp r2, #0
	beq _080103D8
	ldr r0, _080103BC @ =0x030004E0
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	strh r1, [r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	strh r1, [r0, #2]
	b _080103E6
	.align 2, 0
_080103BC: .4byte 0x030004E0
_080103C0:
	cmp r2, #0
	beq _080103D8
	ldr r0, _080103D0 @ =0x030004B0
	ldr r1, [r2, #4]
	ldrb r1, [r1, #4]
	str r1, [r0, #0x30]
	b _080103E6
	.align 2, 0
_080103D0: .4byte 0x030004B0
_080103D4:
	cmp r2, #0
	bne _080103DC
_080103D8:
	movs r0, #6
	b _080103E8
_080103DC:
	adds r0, r2, #0
	bl sub_8018FAC
	ldr r1, _080103F0 @ =0x030004B0
_080103E4:
	str r0, [r1, #0x30]
_080103E6:
	movs r0, #0
_080103E8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080103F0: .4byte 0x030004B0

