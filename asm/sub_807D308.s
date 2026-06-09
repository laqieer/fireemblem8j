	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_807D308, "ax", %progbits
@ sub_807D308 @ JP 0x0807D308 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807D308
	.thumb_func
sub_807D308:
	push {lr}
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #7
	bgt _0807D31E
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
_0807D31E:
	pop {r0}
	bx r0
	.align 2, 0

