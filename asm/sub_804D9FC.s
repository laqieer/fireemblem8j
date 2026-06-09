	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_804D9FC, "ax", %progbits
@ sub_804D9FC @ JP 0x0804D9FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D9FC
	.thumb_func
sub_804D9FC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804DA14 @ =0x085D4B34
	bl Proc_Find
	ldr r1, [r0, #0x30]
	adds r1, r1, r4
	str r1, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804DA14: .4byte 0x085D4B34

