	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_807DF38, "ax", %progbits
@ sub_807DF38 @ JP 0x0807DF38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807DF38
	.thumb_func
sub_807DF38:
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl sub_804F610
	pop {r0}
	bx r0

