	.syntax unified
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80C206C, "ax", %progbits
@ sub_80C206C @ JP 0x080C206C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C206C
	.thumb_func
sub_80C206C:
	push {lr}
	adds r0, #0xce
	movs r2, #3
	bl sub_80D6370
	pop {r0}
	bx r0
	.align 2, 0

