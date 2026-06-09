	.syntax unified
	.set Proc_GotoScript, 0x08002EAC + 1
	.section .text.sub_8050294, "ax", %progbits
@ sub_8050294 @ JP 0x08050294 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050294
	.thumb_func
sub_8050294:
	push {lr}
	ldr r1, _080502A0 @ =0x085E06F8
	bl Proc_GotoScript
	pop {r1}
	bx r1
	.align 2, 0
_080502A0: .4byte 0x085E06F8

