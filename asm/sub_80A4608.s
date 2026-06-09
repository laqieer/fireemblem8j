	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80088FC, 0x080088FC + 1
	.section .text.sub_80A4608, "ax", %progbits
@ sub_80A4608 @ JP 0x080A4608 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A4608
	.thumb_func
sub_80A4608:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80088FC
	cmp r0, #1
	bne _080A461E
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _080A4626
_080A461E:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080A4626:
	pop {r4}
	pop {r0}
	bx r0

