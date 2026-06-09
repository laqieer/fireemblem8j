	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80C1308, "ax", %progbits
@ sub_80C1308 @ JP 0x080C1308 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C1308
	.thumb_func
sub_80C1308:
	push {lr}
	ldr r0, _080C131C @ =0x08AC1108
	bl Proc_Find
	movs r1, #9
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080C131C: .4byte 0x08AC1108

