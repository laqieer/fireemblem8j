	.syntax unified
	.set vfprintf, 0x080D6B14 + 1
	.section .text.sub_80D6A4C, "ax", %progbits
@ vsprintf @ JP 0x080D6A4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global vsprintf
	.thumb_func
vsprintf:
	push {r4, r5, lr}
	sub sp, #0x58
	mov r4, sp
	movs r5, #0
	movs r3, #0x82
	lsls r3, r3, #2
	strh r3, [r4, #0xc]
	str r0, [sp]
	str r0, [sp, #0x10]
	ldr r0, _080D6A78 @ =0x7FFFFFFF
	str r0, [sp, #8]
	str r0, [sp, #0x14]
	ldr r0, _080D6A7C @ =0x08BB8A74
	ldr r0, [r0]
	str r0, [sp, #0x54]
	mov r0, sp
	bl vfprintf
	ldr r1, [sp]
	strb r5, [r1]
	add sp, #0x58
	pop {r4, r5, pc}
	.align 2, 0
_080D6A78: .4byte 0x7FFFFFFF
_080D6A7C: .4byte 0x08BB8A74

