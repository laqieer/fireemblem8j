	.syntax unified
	.set sub_804987C, 0x0804987C + 1
	.section .text.sub_804AD2C, "ax", %progbits
@ sub_804AD2C @ JP 0x0804AD2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804AD2C
	.thumb_func
sub_804AD2C:
	push {lr}
	bl sub_804987C
	pop {r0}
	bx r0
	.align 2, 0

