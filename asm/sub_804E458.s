	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_804E458, "ax", %progbits
@ sub_804E458 @ JP 0x0804E458 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804E458
	.thumb_func
sub_804E458:
	push {lr}
	ldr r0, _0804E464 @ =0x085D4C6C
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_0804E464: .4byte 0x085D4C6C

