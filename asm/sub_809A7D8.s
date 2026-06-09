	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_809A7D8, "ax", %progbits
@ sub_809A7D8 @ JP 0x0809A7D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A7D8
	.thumb_func
sub_809A7D8:
	push {lr}
	ldr r0, _0809A7E8 @ =0x08A94688
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0809A7E8: .4byte 0x08A94688

