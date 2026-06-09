	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80D0DB4, "ax", %progbits
@ sub_80D0DB4 @ JP 0x080D0DB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D0DB4
	.thumb_func
sub_80D0DB4:
	push {lr}
	adds r2, r0, #0
	ldr r0, _080D0DD4 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080D0DCE
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_080D0DCE:
	pop {r0}
	bx r0
	.align 2, 0
_080D0DD4: .4byte 0x085775CC

