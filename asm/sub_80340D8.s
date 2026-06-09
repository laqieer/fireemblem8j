	.syntax unified
	.set BMapDispSuspend, 0x080300D4 + 1
	.set LockGame, 0x08015384 + 1
	.section .text.sub_80340D8, "ax", %progbits
@ sub_80340D8 @ JP 0x080340D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80340D8
	.thumb_func
sub_80340D8:
	push {lr}
	bl LockGame
	bl BMapDispSuspend
	ldr r2, _08034104 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_08034104: .4byte 0x03003020

