	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_FindAfterWithParent, 0x080033EC + 1
	.section .text.sub_80B2874, "ax", %progbits
@ sub_80B2874 @ JP 0x080B2874 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2874
	.thumb_func
sub_80B2874:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _080B2882
_080B287C:
	adds r0, r4, #0
	bl Proc_End
_080B2882:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_FindAfterWithParent
	adds r4, r0, #0
	cmp r4, #0
	bne _080B287C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

