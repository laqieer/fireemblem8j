	.syntax unified
	.set sub_80D6368, 0x080D6368 + 1
	.section .text.sub_80CA318, "ax", %progbits
@ sub_80CA318 @ JP 0x080CA318 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CA318
	.thumb_func
sub_80CA318:
	push {lr}
	sub sp, #0x14
	movs r1, #0xf0
	lsls r1, r1, #7
	str r1, [sp]
	movs r1, #0xa0
	lsls r1, r1, #7
	str r1, [sp, #4]
	mov r2, sp
	movs r3, #0
	movs r1, #0x78
	strh r1, [r2, #8]
	movs r1, #0x50
	strh r1, [r2, #0xa]
	mov r1, sp
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	mov r0, sp
	strh r3, [r0, #0x10]
	ldr r1, _080CA34C @ =0x03003068
	movs r2, #1
	bl sub_80D6368
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_080CA34C: .4byte 0x03003068

