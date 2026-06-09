	.syntax unified
	.set CheckGameEndFlag, 0x080A96F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80C9568, "ax", %progbits
@ sub_80C9568 @ JP 0x080C9568 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C9568
	.thumb_func
sub_80C9568:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	ldr r0, _080C95A8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C9590
	bl CheckGameEndFlag
	cmp r0, #0
	beq _080C9590
	movs r0, #0
	strh r0, [r4]
_080C9590:
	adds r0, r5, #0
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bgt _080C95A2
	adds r0, r5, #0
	bl sub_8002DE4
_080C95A2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C95A8: .4byte 0x085775CC

