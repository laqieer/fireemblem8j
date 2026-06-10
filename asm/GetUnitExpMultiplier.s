	.syntax unified
	.section .text.GetUnitExpMultiplier, "ax", %progbits
@ GetUnitExpMultiplier @ JP 0x0802C354 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetUnitExpMultiplier
	.thumb_func
GetUnitExpMultiplier:
	push {lr}
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	bne _0802C370
	b _0802C38C
_0802C36C:
	movs r0, #2
	b _0802C38E
_0802C370:
	movs r2, #0
	movs r3, #0x80
	lsls r3, r3, #4
	ldr r1, _0802C394 @ =0x0203A5E8
_0802C378:
	ldr r0, [r1]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	ands r0, r3
	cmp r0, #0
	bne _0802C36C
	adds r1, #4
	adds r2, #1
	cmp r2, #6
	ble _0802C378
_0802C38C:
	movs r0, #1
_0802C38E:
	pop {r1}
	bx r1
	.align 2, 0
_0802C394: .4byte 0x0203A5E8

