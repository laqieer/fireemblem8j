	.syntax unified
	.set HideMu, 0x0807BBE8 + 1
	.section .text.sub_804CF28, "ax", %progbits
@ sub_804CF28 @ JP 0x0804CF28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804CF28
	.thumb_func
sub_804CF28:
	push {lr}
	ldr r0, [r0, #0x30]
	bl HideMu
	pop {r0}
	bx r0

