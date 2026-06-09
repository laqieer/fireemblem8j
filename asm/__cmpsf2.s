	.syntax unified
	.set __fpcmp_parts_f, 0x080DBC9C + 1
	.set __unpack_f, 0x080DB7F4 + 1
	.section .text.__cmpsf2, "ax", %progbits
@ __cmpsf2 @ JP 0x080DBD80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __cmpsf2
	.thumb_func
__cmpsf2:
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0

