	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_800226C, 0x0800226C + 1
	.section .text.sub_80C96D0, "ax", %progbits
@ sub_80C96D0 @ JP 0x080C96D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C96D0
	.thumb_func
sub_80C96D0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C96F8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C96F0
	movs r0, #1
	bl sub_800226C
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
_080C96F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C96F8: .4byte 0x085775CC

