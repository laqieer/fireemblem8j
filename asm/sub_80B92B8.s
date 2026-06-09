	.syntax unified
	.set GetConvoyItemCount, 0x080314BC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80B92B8, "ax", %progbits
@ sub_80B92B8 @ JP 0x080B92B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B92B8
	.thumb_func
sub_80B92B8:
	push {r4, lr}
	adds r4, r0, #0
	bl GetConvoyItemCount
	cmp r0, #0x63
	bgt _080B92CC
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
_080B92CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

