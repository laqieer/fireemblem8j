	.syntax unified
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.section .text.sub_80662DC, "ax", %progbits
@ sub_80662DC @ JP 0x080662DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80662DC
	.thumb_func
sub_80662DC:
	push {lr}
	bl sub_8056130
	ldr r1, _080662F4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	pop {r0}
	bx r0
	.align 2, 0
_080662F4: .4byte 0x0201774C

