	.syntax unified
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.section .text.sub_8066E24, "ax", %progbits
@ sub_8066E24 @ JP 0x08066E24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8066E24
	.thumb_func
sub_8066E24:
	push {lr}
	bl sub_8056130
	ldr r1, _08066E3C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	pop {r0}
	bx r0
	.align 2, 0
_08066E3C: .4byte 0x0201774C

