	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set PidStatsSubFavval100, 0x080A9334 + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_803411C, 0x0803411C + 1
	.set sub_80A9210, 0x080A9210 + 1
	.section .text.sub_8034180, "ax", %progbits
@ sub_8034180 @ JP 0x08034180 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034180
	.thumb_func
sub_8034180:
	push {r4, lr}
	movs r4, #1
_08034184:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080341C2
	ldr r3, [r2]
	cmp r3, #0
	beq _080341C2
	ldr r1, [r2, #0xc]
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
	ldr r0, _080341B8 @ =0x02010004
	ands r0, r1
	cmp r0, #0
	bne _080341C2
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080341BC
	ldrb r0, [r3, #4]
	bl PidStatsSubFavval100
	b _080341C2
	.align 2, 0
_080341B8: .4byte 0x02010004
_080341BC:
	ldrb r0, [r3, #4]
	bl sub_80A9210
_080341C2:
	adds r4, #1
	cmp r4, #0x3f
	ble _08034184
	bl sub_803411C
	ldr r0, _080341F8 @ =0x085C609C
	bl Proc_EndEach
	ldr r3, _080341FC @ =0x0202BCAC
	ldrb r2, [r3, #4]
	movs r1, #0xef
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #4]
	ldr r2, _08034200 @ =0x0202BCEC
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	adds r2, #0x4a
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080341F8: .4byte 0x085C609C
_080341FC: .4byte 0x0202BCAC
_08034200: .4byte 0x0202BCEC

