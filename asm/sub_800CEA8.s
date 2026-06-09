	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80BE01C, 0x080BE01C + 1
	.section .text.sub_800CEA8, "ax", %progbits
@ sub_800CEA8 @ JP 0x0800CEA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CEA8
	.thumb_func
sub_800CEA8:
	push {lr}
	ldr r0, _0800CEBC @ =0x08AC1108
	bl Proc_Find
	bl sub_80BE01C
	movs r0, #2
	pop {r1}
	bx r1
	.align 2, 0
_0800CEBC: .4byte 0x08AC1108

