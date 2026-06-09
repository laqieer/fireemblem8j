	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8091544, "ax", %progbits
@ sub_8091544 @ JP 0x08091544 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8091544
	.thumb_func
sub_8091544:
	push {lr}
	ldr r0, _08091554 @ =0x08A73E74
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08091554: .4byte 0x08A73E74

