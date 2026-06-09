	.syntax unified
	.set sub_8001EF0, 0x08001EF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_806B858, "ax", %progbits
@ sub_806B858 @ JP 0x0806B858 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806B858
	.thumb_func
sub_806B858:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #4]
	ldr r0, _0806B88C @ =0x020228A8
	mov sb, r0
	ldr r1, _0806B890 @ =0x020165C8
	mov r8, r1
	ldr r0, [sp, #4]
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x28
	ble _0806B894
	adds r3, r1, #0
	subs r3, #0x28
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	b _0806B8AA
	.align 2, 0
_0806B88C: .4byte 0x020228A8
_0806B890: .4byte 0x020165C8
_0806B894:
	cmp r1, #0x18
	ble _0806B89C
	movs r6, #0x10
	b _0806B8B0
_0806B89C:
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
_0806B8AA:
	bl sub_8012E84
	adds r6, r0, #0
_0806B8B0:
	mov r2, sb
	ldrh r0, [r2]
	mov r7, r8
	strh r0, [r7]
	movs r2, #0
	ldr r0, [sp, #4]
	adds r0, #0x4c
	str r0, [sp, #8]
_0806B8C0:
	subs r0, r2, #1
	cmp r0, #0x1d
	bhi _0806B954
	lsls r0, r0, #2
	ldr r1, _0806B8D0 @ =_0806B8D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B8D0: .4byte _0806B8D4
_0806B8D4: @ jump table
	.4byte _0806B94C @ case 0
	.4byte _0806B94C @ case 1
	.4byte _0806B94C @ case 2
	.4byte _0806B954 @ case 3
	.4byte _0806B954 @ case 4
	.4byte _0806B954 @ case 5
	.4byte _0806B954 @ case 6
	.4byte _0806B954 @ case 7
	.4byte _0806B954 @ case 8
	.4byte _0806B954 @ case 9
	.4byte _0806B954 @ case 10
	.4byte _0806B954 @ case 11
	.4byte _0806B954 @ case 12
	.4byte _0806B954 @ case 13
	.4byte _0806B954 @ case 14
	.4byte _0806B94C @ case 15
	.4byte _0806B954 @ case 16
	.4byte _0806B954 @ case 17
	.4byte _0806B954 @ case 18
	.4byte _0806B954 @ case 19
	.4byte _0806B94C @ case 20
	.4byte _0806B94C @ case 21
	.4byte _0806B954 @ case 22
	.4byte _0806B954 @ case 23
	.4byte _0806B954 @ case 24
	.4byte _0806B954 @ case 25
	.4byte _0806B94C @ case 26
	.4byte _0806B94C @ case 27
	.4byte _0806B94C @ case 28
	.4byte _0806B94C @ case 29
_0806B94C:
	ldr r1, _0806B950 @ =0x00007C1F
	b _0806B956
	.align 2, 0
_0806B950: .4byte 0x00007C1F
_0806B954:
	movs r1, #0
_0806B956:
	movs r7, #2
	add sb, r7
	movs r0, #2
	add r8, r0
	lsrs r7, r1, #5
	str r7, [sp, #0x10]
	lsrs r0, r1, #0xa
	str r0, [sp, #0x14]
	adds r2, #1
	str r2, [sp, #0xc]
	movs r2, #0x1f
	mov ip, r2
	movs r5, #0x1f
	movs r0, #0x10
	subs r4, r0, r6
	movs r7, #0xe
	str r7, [sp, #0x18]
	ands r1, r5
	adds r0, r1, #0
	muls r0, r6, r0
	mov sl, r0
_0806B980:
	mov r2, sb
	ldrh r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	adds r3, r0, #0
	muls r3, r4, r3
	add r3, sl
	asrs r3, r3, #4
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r7, ip
	ands r0, r7
	adds r2, r0, #0
	muls r2, r4, r2
	asrs r2, r2, #4
	lsrs r1, r1, #0x1a
	mov r0, ip
	ands r1, r0
	muls r1, r4, r1
	ldr r0, [sp, #0x14]
	ands r0, r7
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	ands r1, r5
	lsls r1, r1, #0xa
	ands r2, r5
	lsls r2, r2, #5
	orrs r1, r2
	ands r3, r5
	orrs r3, r1
	mov r0, r8
	strh r3, [r0]
	movs r1, #2
	add sb, r1
	add r8, r1
	ldr r2, [sp, #0x18]
	subs r2, #1
	str r2, [sp, #0x18]
	cmp r2, #0
	bge _0806B980
	ldr r2, [sp, #0xc]
	cmp r2, #0x1f
	bgt _0806B9DA
	b _0806B8C0
_0806B9DA:
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r0, _0806BA14 @ =0x020165C8
	bl sub_80D636C
	bl sub_8001EF0
	ldr r7, [sp, #8]
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0x40
	bne _0806B9FC
	ldr r0, [sp, #4]
	bl sub_8002DE4
_0806B9FC:
	ldr r2, [sp, #8]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BA14: .4byte 0x020165C8

