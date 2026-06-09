	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8091574, "ax", %progbits
@ sub_8091574 @ JP 0x08091574 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8091574
	.thumb_func
sub_8091574:
	push {lr}
	ldr r0, _0809158C @ =0x08A73E74
	bl Proc_Find
	cmp r0, #0
	beq _08091586
	movs r1, #0
	bl Proc_Goto
_08091586:
	pop {r0}
	bx r0
	.align 2, 0
_0809158C: .4byte 0x08A73E74

