	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80356C8, 0x080356C8 + 1
	.section .text.sub_80357BC, "ax", %progbits
@ sub_80357BC @ JP 0x080357BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80357BC
	.thumb_func
sub_80357BC:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08035814 @ =0x085C66D0
	adds r4, r5, #0
	adds r4, #0x5a
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_80356C8
	ldrh r1, [r4]
	movs r3, #0
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _080357E0
	subs r0, r1, #1
	strh r0, [r4]
_080357E0:
	adds r1, r5, #0
	adds r1, #0x58
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x1d
	bgt _080357F2
	adds r0, r2, #1
	strh r0, [r1]
_080357F2:
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1e
	bne _0803580E
	ldr r0, _08035818 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0803580E
	adds r0, r5, #0
	bl sub_8002DE4
_0803580E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08035814: .4byte 0x085C66D0
_08035818: .4byte 0x085775CC

