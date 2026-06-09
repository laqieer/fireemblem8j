	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8068F58, "ax", %progbits
@ sub_8068F58 @ JP 0x08068F58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8068F58
	.thumb_func
sub_8068F58:
	push {lr}
	ldr r2, _08068F6C @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	bl sub_8002DE4
	pop {r0}
	bx r0
	.align 2, 0
_08068F6C: .4byte 0x0201774C

