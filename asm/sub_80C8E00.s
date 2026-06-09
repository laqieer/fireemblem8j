	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C8E00, "ax", %progbits
@ sub_80C8E00 @ JP 0x080C8E00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8E00
	.thumb_func
sub_80C8E00:
	push {lr}
	ldr r0, _080C8E0C @ =0x08AC28B0
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_080C8E0C: .4byte 0x08AC28B0

