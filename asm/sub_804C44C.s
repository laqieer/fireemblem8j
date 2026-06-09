	.syntax unified
	.set sub_807B4C8, 0x0807B4C8 + 1
	.section .text.sub_804C44C, "ax", %progbits
@ sub_804C44C @ JP 0x0804C44C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C44C
	.thumb_func
sub_804C44C:
	push {lr}
	ldr r0, [r0, #0x54]
	bl sub_807B4C8
	pop {r0}
	bx r0

