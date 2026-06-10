	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.section .text.sub_803B99C, "ax", %progbits
@ sub_803B99C @ JP 0x0803B99C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803B99C
	.thumb_func
sub_803B99C:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #0
	strb r5, [r6]
	ldr r4, _0803B9BC @ =0x03004DF0
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #5
	bne _0803B9C4
	ldr r0, [r4]
	ldrb r1, [r0, #0xa]
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #0xa]
	b _0803BA06
	.align 2, 0
_0803B9BC: .4byte 0x03004DF0
_0803B9C0:
	movs r0, #1
	b _0803BA08
_0803B9C4:
	movs r5, #0
	adds r7, r4, #0
_0803B9C8:
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	beq _0803BA06
	strb r5, [r6]
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x69
	beq _0803B9C0
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x6b
	bne _0803BA00
	ldr r0, [r7]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	bne _0803B9C0
_0803BA00:
	adds r5, #1
	cmp r5, #4
	ble _0803B9C8
_0803BA06:
	movs r0, #0
_0803BA08:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

