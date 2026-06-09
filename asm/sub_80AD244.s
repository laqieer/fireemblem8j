	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set StartBgmVolumeChange, 0x08002680 + 1
	.section .text.sub_80AD244, "ax", %progbits
@ sub_80AD244 @ JP 0x080AD244 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AD244
	.thumb_func
sub_80AD244:
	push {lr}
	movs r1, #0x12
	bl Proc_Goto
	movs r0, #0xc0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	pop {r0}
	bx r0

