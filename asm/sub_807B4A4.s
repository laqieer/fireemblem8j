	.syntax unified
	.set AP_Delete, 0x08009194 + 1
	.section .text.sub_807B4A4, "ax", %progbits
@ sub_807B4A4 @ JP 0x0807B4A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B4A4
	.thumb_func
sub_807B4A4:
	push {lr}
	ldr r2, [r0, #0x34]
	movs r1, #0
	strb r1, [r2]
	ldr r0, [r0, #0x30]
	bl AP_Delete
	pop {r0}
	bx r0
	.align 2, 0

