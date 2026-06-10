	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8009EA0, "ax", %progbits
@ sub_8009EA0 @ JP 0x08009EA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009EA0
	.thumb_func
sub_8009EA0:
	push {lr}
	ldr r0, _08009EAC @ =0x085B946C
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_08009EAC: .4byte 0x085B946C

