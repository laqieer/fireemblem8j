	.syntax unified
	.set __pack_d, 0x080DA9A0 + 1
	.section .text.__make_dp, "ax", %progbits
@ __make_dp @ JP 0x080DB6D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __make_dp
	.thumb_func
__make_dp:
	sub sp, #4
	push {r4, lr}
	sub sp, #0x14
	str r3, [sp, #0x1c]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r4, [sp, #0x10]
	mov r0, sp
	bl __pack_d
	add sp, #0x14
	pop {r4}
	pop {r3}
	add sp, #4
	bx r3
	.align 2, 0

