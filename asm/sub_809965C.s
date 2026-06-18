	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_809965C, "ax", %progbits
@ FadeOutCgText @ JP 0x0809965C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global FadeOutCgText
	.thumb_func
FadeOutCgText:
	push {lr}
	ldr r0, _08099674 @ =0x08A94430
	bl Proc_Find
	cmp r0, #0
	beq _0809966E
	movs r1, #0
	bl Proc_Goto
_0809966E:
	pop {r0}
	bx r0
	.align 2, 0
_08099674: .4byte 0x08A94430

