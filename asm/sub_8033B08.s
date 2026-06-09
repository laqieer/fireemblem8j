	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8033B08, "ax", %progbits
@ sub_8033B08 @ JP 0x08033B08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033B08
	.thumb_func
sub_8033B08:
	push {lr}
	ldr r0, _08033B1C @ =0x085C609C
	bl Proc_Find
	movs r1, #0x33
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08033B1C: .4byte 0x085C609C

