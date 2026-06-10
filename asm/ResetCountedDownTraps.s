	.syntax unified
	.section .text.ResetCountedDownTraps, "ax", %progbits
@ ResetCountedDownTraps @ JP 0x0802E908 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ResetCountedDownTraps
	.thumb_func
ResetCountedDownTraps:
	push {lr}
	ldr r1, _0802E910 @ =0x0203A610
	b _0802E92C
	.align 2, 0
_0802E910: .4byte 0x0203A610
_0802E914:
	ldrb r0, [r1, #2]
	cmp r0, #7
	bgt _0802E92A
	cmp r0, #4
	blt _0802E92A
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802E92A
	ldrb r0, [r1, #5]
	strb r0, [r1, #6]
_0802E92A:
	adds r1, #8
_0802E92C:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802E914
	pop {r0}
	bx r0
	.align 2, 0

