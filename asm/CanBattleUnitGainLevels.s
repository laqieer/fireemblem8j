	.syntax unified
	.section .text.CanBattleUnitGainLevels, "ax", %progbits
@ CanBattleUnitGainLevels @ JP 0x0802B93C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CanBattleUnitGainLevels
	.thumb_func
CanBattleUnitGainLevels:
	push {lr}
	adds r2, r0, #0
	ldr r0, _0802B964 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802B95E
	ldrb r0, [r2, #9]
	cmp r0, #0xff
	beq _0802B968
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802B968
_0802B95E:
	movs r0, #1
	b _0802B96A
	.align 2, 0
_0802B964: .4byte 0x0202BCAC
_0802B968:
	movs r0, #0
_0802B96A:
	pop {r1}
	bx r1
	.align 2, 0

