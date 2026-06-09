	.syntax unified
	.set Proc_GotoScript, 0x08002EAC + 1
	.section .text.sub_8050370, "ax", %progbits
@ sub_8050370 @ JP 0x08050370 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050370
	.thumb_func
sub_8050370:
	push {lr}
	ldr r1, _0805037C @ =0x085E0720
	bl Proc_GotoScript
	pop {r1}
	bx r1
	.align 2, 0
_0805037C: .4byte 0x085E0720

