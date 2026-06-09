	.syntax unified
	.set sub_8005640, 0x08005640 + 1
	.section .text.sub_8005DD0, "ax", %progbits
@ sub_8005DD0 @ JP 0x08005DD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8005DD0
	.thumb_func
sub_8005DD0:
	push {lr}
	ldr r0, [r0, #0x54]
	bl sub_8005640
	pop {r0}
	bx r0

