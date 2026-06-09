	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8099678, "ax", %progbits
@ sub_8099678 @ JP 0x08099678 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8099678
	.thumb_func
sub_8099678:
	push {lr}
	ldr r0, _08099690 @ =0x08A94430
	bl Proc_Find
	cmp r0, #0
	beq _0809968A
	movs r1, #1
	bl Proc_Goto
_0809968A:
	pop {r0}
	bx r0
	.align 2, 0
_08099690: .4byte 0x08A94430

