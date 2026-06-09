	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C41E0, "ax", %progbits
@ sub_80C41E0 @ JP 0x080C41E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C41E0
	.thumb_func
sub_80C41E0:
	push {lr}
	ldr r0, _080C41EC @ =0x08AC1EEC
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_080C41EC: .4byte 0x08AC1EEC

