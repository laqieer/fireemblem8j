	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8006374, 0x08006374 + 1
	.section .text.sub_8006184, "ax", %progbits
@ sub_8006184 @ JP 0x08006184 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006184
	.thumb_func
sub_8006184:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, #1
	str r0, [r4, #0x38]
	movs r1, #0x32
	ldrsh r5, [r4, r1]
	cmp r5, #0
	beq _080061A0
	adds r1, r5, #0
	adds r0, r4, #0
	bl Proc_Goto
	b _080061B6
_080061A0:
	cmp r0, #0
	bge _080061B6
	adds r0, r4, #0
	bl sub_8006374
	str r0, [r4, #0x38]
	strh r5, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080061B6:
	pop {r4, r5}
	pop {r0}
	bx r0

