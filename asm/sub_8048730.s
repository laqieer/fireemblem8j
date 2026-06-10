	.syntax unified
	.set sub_8041818, 0x08041818 + 1
	.set sub_8042FC8, 0x08042FC8 + 1
	.set sub_8045C5C, 0x08045C5C + 1
	.set sub_8045C80, 0x08045C80 + 1
	.set sub_80AB4B8, 0x080AB4B8 + 1
	.section .text.sub_8048730, "ax", %progbits
@ sub_8048730 @ JP 0x08048730 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048730
	.thumb_func
sub_8048730:
	push {lr}
	bl sub_8042FC8
	bl sub_8045C5C
	bl sub_8045C80
	bl sub_8041818
	bl sub_80AB4B8
	pop {r0}
	bx r0
	.align 2, 0

