	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8039708, "ax", %progbits
@ sub_8039708 @ JP 0x08039708 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8039708
	.thumb_func
sub_8039708:
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	adds r0, #1
	str r0, [r1, #0x2c]
	cmp r0, #4
	bgt _0803971E
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_0803971E:
	pop {r0}
	bx r0
	.align 2, 0

