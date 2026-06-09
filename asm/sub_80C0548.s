	.syntax unified
	.set AP_Delete, 0x08009194 + 1
	.section .text.sub_80C0548, "ax", %progbits
@ sub_80C0548 @ JP 0x080C0548 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0548
	.thumb_func
sub_80C0548:
	push {lr}
	ldr r0, [r0, #0x38]
	bl AP_Delete
	pop {r0}
	bx r0

