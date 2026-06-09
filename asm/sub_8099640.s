	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8099640, "ax", %progbits
@ sub_8099640 @ JP 0x08099640 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8099640
	.thumb_func
sub_8099640:
	push {lr}
	ldr r0, _08099658 @ =0x08A94430
	bl Proc_Find
	cmp r0, #0
	beq _08099652
	movs r1, #2
	bl Proc_Goto
_08099652:
	pop {r0}
	bx r0
	.align 2, 0
_08099658: .4byte 0x08A94430

