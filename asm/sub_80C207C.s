	.syntax unified
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80C207C, "ax", %progbits
@ sub_80C207C @ JP 0x080C207C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C207C
	.thumb_func
sub_80C207C:
	push {lr}
	adds r2, r0, #0
	adds r0, r1, #0
	adds r2, #0xce
	adds r1, r2, #0
	movs r2, #3
	bl sub_80D6370
	pop {r0}
	bx r0

