	.syntax unified
	.section .text.GetUnitExpLevel, "ax", %progbits
@ GetUnitExpLevel @ JP 0x0802C28C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetUnitExpLevel
	.thumb_func
GetUnitExpLevel:
	push {lr}
	movs r3, #8
	ldrsb r3, [r0, r3]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802C2A8
	adds r3, #0x14
_0802C2A8:
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0

