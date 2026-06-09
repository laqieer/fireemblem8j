	.syntax unified
	.section .text.RevertMovementScript, "ax", %progbits
@ RevertMovementScript @ JP 0x0801A4D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global RevertMovementScript
	.thumb_func
RevertMovementScript:
	push {lr}
	sub sp, #0x40
	adds r3, r0, #0
	mov r2, sp
	cmp r1, r3
	bls _0801A4E8
_0801A4DC:
	subs r1, #1
	ldrb r0, [r1]
	strb r0, [r2]
	adds r2, #1
	cmp r1, r3
	bhi _0801A4DC
_0801A4E8:
	movs r0, #4
	strb r0, [r2]
	mov r2, sp
	b _0801A4F6
_0801A4F0:
	strb r0, [r3]
	adds r2, #1
	adds r3, #1
_0801A4F6:
	ldrb r0, [r2]
	cmp r0, #4
	bne _0801A4F0
	movs r0, #4
	strb r0, [r3]
	add sp, #0x40
	pop {r0}
	bx r0
	.align 2, 0

