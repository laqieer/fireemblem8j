	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_805B7CC, "ax", %progbits
@ sub_805B7CC @ JP 0x0805B7CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805B7CC
	.thumb_func
sub_805B7CC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	bl AnimDelete
	ldr r0, [r4, #0x18]
	bl AnimDelete
	movs r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x34]
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

