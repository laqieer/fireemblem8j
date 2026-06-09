	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80C13DC, "ax", %progbits
@ sub_80C13DC @ JP 0x080C13DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C13DC
	.thumb_func
sub_80C13DC:
	push {lr}
	ldr r0, _080C13F0 @ =0x08AC1108
	bl Proc_Find
	movs r1, #0xd
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080C13F0: .4byte 0x08AC1108

