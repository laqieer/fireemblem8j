	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_80A7620, "ax", %progbits
@ sub_80A7620 @ JP 0x080A7620 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7620
	.thumb_func
sub_80A7620:
	push {lr}
	ldr r0, [r0, #0x2c]
	bl Proc_End
	ldr r2, _080A764C @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_080A764C: .4byte 0x03003020

