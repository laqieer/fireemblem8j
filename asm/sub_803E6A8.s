	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set GetItemIndex, 0x08017294 + 1
	.set sub_803B810, 0x0803B810 + 1
	.section .text.sub_803E6A8, "ax", %progbits
@ sub_803E6A8 @ JP 0x0803E6A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803E6A8
	.thumb_func
sub_803E6A8:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r6, #0
	ldr r7, _0803E724 @ =0x03004DF0
_0803E6B0:
	ldr r0, [r7]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	cmp r4, #0
	beq _0803E756
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x6c
	beq _0803E6D4
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x6d
	bne _0803E750
_0803E6D4:
	ldr r0, _0803E728 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0803E72C
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r0, [r0]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0803E72C
	add r5, sp, #0xc
	adds r0, r2, #0
	adds r1, r5, #0
	bl sub_803B810
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803E750
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	b _0803E744
	.align 2, 0
_0803E724: .4byte 0x03004DF0
_0803E728: .4byte 0x0203AA00
_0803E72C:
	ldr r1, [r7]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
_0803E744:
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
	movs r0, #1
	b _0803E758
_0803E750:
	adds r6, #1
	cmp r6, #4
	ble _0803E6B0
_0803E756:
	movs r0, #0
_0803E758:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

