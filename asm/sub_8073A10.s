	.syntax unified
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_8073A10, "ax", %progbits
@ sub_8073A10 @ JP 0x08073A10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8073A10
	.thumb_func
sub_8073A10:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	movs r6, #0
	cmp r6, r7
	bhs _08073A5E
	movs r0, #0x1f
	mov r8, r0
_08073A26:
	ldrh r2, [r5]
	adds r5, #2
	movs r1, #0x1f
	ands r1, r2
	lsrs r3, r2, #5
	mov r0, r8
	ands r3, r0
	lsrs r2, r2, #0xa
	ands r2, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0xa
	bl sub_80D6374
	strb r0, [r4]
	adds r4, #1
	strb r0, [r4]
	adds r4, #1
	strb r0, [r4]
	adds r4, #1
	adds r6, #1
	cmp r6, r7
	blo _08073A26
_08073A5E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

