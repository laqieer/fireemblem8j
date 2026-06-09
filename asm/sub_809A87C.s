	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_809A87C, "ax", %progbits
@ sub_809A87C @ JP 0x0809A87C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A87C
	.thumb_func
sub_809A87C:
	push {lr}
	ldr r0, _0809A88C @ =0x08A946D0
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0809A88C: .4byte 0x08A946D0

