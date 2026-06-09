	.syntax unified
	.set sub_80253F0, 0x080253F0 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.section .text.sub_8022910, "ax", %progbits
@ sub_8022910 @ JP 0x08022910 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022910
	.thumb_func
sub_8022910:
	push {lr}
	ldr r0, _08022928 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_80253F0
	ldr r0, _0802292C @ =0x085C5938
	bl sub_80507B0
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022928: .4byte 0x03004DF0
_0802292C: .4byte 0x085C5938

