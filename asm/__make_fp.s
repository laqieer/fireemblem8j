	.syntax unified
	.set __pack_f, 0x080DB73C + 1
	.section .text.__make_fp, "ax", %progbits
@ __make_fp @ JP 0x080DC044 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __make_fp
	.thumb_func
__make_fp:
	push {lr}
	sub sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, sp
	bl __pack_f
	add sp, #0x10
	pop {pc}
	.align 2, 0

