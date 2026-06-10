	.syntax unified
	.set sub_807B4C8, 0x0807B4C8 + 1
	.section .text.sub_80327AC, "ax", %progbits
@ sub_80327AC @ JP 0x080327AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80327AC
	.thumb_func
sub_80327AC:
	push {lr}
	ldr r0, [r0, #0x54]
	bl sub_807B4C8
	pop {r0}
	bx r0

