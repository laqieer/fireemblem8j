	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80BEDE8, 0x080BEDE8 + 1
	.section .text.sub_80BEE54, "ax", %progbits
@ sub_80BEE54 @ JP 0x080BEE54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BEE54
	.thumb_func
sub_80BEE54:
	push {lr}
	ldr r0, _080BEE64 @ =0x08AC1108
	bl Proc_Find
	bl sub_80BEDE8
	pop {r0}
	bx r0
	.align 2, 0
_080BEE64: .4byte 0x08AC1108

