	.syntax unified
	.section .text.BattlePrintDebugHitInfo, "ax", %progbits
@ BattlePrintDebugHitInfo @ JP 0x0802CA34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BattlePrintDebugHitInfo
	.thumb_func
BattlePrintDebugHitInfo:
	push {lr}
	ldr r2, _0802CA44 @ =0x0203A5E8
	ldr r0, [r2]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	b _0802CA50
	.align 2, 0
_0802CA44: .4byte 0x0203A5E8
_0802CA48:
	adds r2, #4
	ldr r0, [r2]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
_0802CA50:
	ands r0, r1
	cmp r0, #0
	beq _0802CA48
	pop {r0}
	bx r0
	.align 2, 0

