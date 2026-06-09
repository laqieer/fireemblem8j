	.syntax unified
	.set AP_Delete, 0x08009194 + 1
	.set sub_801D730, 0x0801D730 + 1
	.section .text.sub_80297E0, "ax", %progbits
@ sub_80297E0 @ JP 0x080297E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80297E0
	.thumb_func
sub_80297E0:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_801D730
	ldr r0, [r4, #0x54]
	bl AP_Delete
	pop {r4}
	pop {r0}
	bx r0

