	.syntax unified
	.set __pack_d, 0x080DA9A0 + 1
	.set __unpack_d, 0x080DAAE8 + 1
	.section .text.__negdf2, "ax", %progbits
@ __negdf2 @ JP 0x080DB6A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __negdf2
	.thumb_func
__negdf2:
	push {lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _080DB6C2
	movs r1, #1
_080DB6C2:
	str r1, [sp, #4]
	mov r0, sp
	bl __pack_d
	add sp, #0x1c
	pop {pc}
	.align 2, 0

