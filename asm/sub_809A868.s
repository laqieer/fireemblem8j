	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_809A868, "ax", %progbits
@ sub_809A868 @ JP 0x0809A868 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A868
	.thumb_func
sub_809A868:
	push {lr}
	ldr r0, _0809A878 @ =0x08A946D0
	bl Proc_Find
	movs r1, #0
	str r1, [r0, #0x34]
	pop {r0}
	bx r0
	.align 2, 0
_0809A878: .4byte 0x08A946D0

