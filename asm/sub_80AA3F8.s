	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80ABBFC, 0x080ABBFC + 1
	.section .text.sub_80AA3F8, "ax", %progbits
@ sub_80AA3F8 @ JP 0x080AA3F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AA3F8
	.thumb_func
sub_80AA3F8:
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	mov r0, sp
	bl sub_80ABBFC
	mov r0, sp
	adds r1, r4, #0
	movs r2, #8
	bl WriteAndVerifySramFast
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

