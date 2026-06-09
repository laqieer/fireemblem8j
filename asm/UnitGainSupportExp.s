	.syntax unified
	.set GetUnitSupportLevel, 0x080281D0 + 1
	.section .text.UnitGainSupportExp, "ax", %progbits
@ UnitGainSupportExp @ JP 0x08028224 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnitGainSupportExp
	.thumb_func
UnitGainSupportExp:
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08028260
	adds r0, #0xe
	adds r0, r0, r1
	ldrb r6, [r0]
	adds r0, r2, #0
	adds r0, #0x32
	adds r7, r0, r1
	ldrb r5, [r7]
	ldr r4, _08028268 @ =0x085C3E88
	adds r0, r2, #0
	bl GetUnitSupportLevel
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r5, r6
	cmp r0, r1
	ble _08028254
	subs r6, r1, r5
_08028254:
	adds r0, r5, r6
	strb r0, [r7]
	ldr r1, _0802826C @ =0x0202BCEC
	ldrh r0, [r1, #0x16]
	adds r0, r0, r6
	strh r0, [r1, #0x16]
_08028260:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028268: .4byte 0x085C3E88
_0802826C: .4byte 0x0202BCEC

