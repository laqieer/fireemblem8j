	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80995B8, 0x080995B8 + 1
	.section .text.sub_8099594, "ax", %progbits
@ sub_8099594 @ JP 0x08099594 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8099594
	.thumb_func
sub_8099594:
	push {r4, lr}
	ldr r0, _080995B4 @ =0x08A94430
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080995AE
	bl sub_80995B8
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
_080995AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080995B4: .4byte 0x08A94430

