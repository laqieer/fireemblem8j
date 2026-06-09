	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80943BC, 0x080943BC + 1
	.section .text.sub_80225D8, "ax", %progbits
@ sub_80225D8 @ JP 0x080225D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80225D8
	.thumb_func
sub_80225D8:
	push {lr}
	ldr r0, _080225F0 @ =0x085C2F58
	bl Proc_Find
	movs r1, #0xa
	bl Proc_Goto
	bl sub_80943BC
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080225F0: .4byte 0x085C2F58

