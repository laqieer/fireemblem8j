	.syntax unified
	.set sub_80505A0, 0x080505A0 + 1
	.section .text.sub_80D280C, "ax", %progbits
@ sub_80D280C @ JP 0x080D280C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D280C
	.thumb_func
sub_80D280C:
	push {lr}
	bl sub_80505A0
	movs r0, #0
	pop {r1}
	bx r1

