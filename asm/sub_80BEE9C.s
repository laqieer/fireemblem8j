	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80BEE9C, "ax", %progbits
@ sub_80BEE9C @ JP 0x080BEE9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BEE9C
	.thumb_func
sub_80BEE9C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BEEB4 @ =0x08AC1108
	bl Proc_Find
	str r4, [r0, #0x2c]
	movs r1, #0
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BEEB4: .4byte 0x08AC1108

