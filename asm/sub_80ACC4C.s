	.syntax unified
	.set InitMinimapWindowBuffers, 0x080AC91C + 1
	.set InitWindowScanlineBounds, 0x08013288 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80132A8, 0x080132A8 + 1
	.section .text.sub_80ACC4C, "ax", %progbits
@ sub_80ACC4C @ JP 0x080ACC4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ACC4C
	.thumb_func
sub_80ACC4C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	adds r6, r0, #0
	adds r6, #0x4c
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _080ACC68
	adds r0, #3
_080ACC68:
	asrs r0, r0, #2
	movs r3, #4
	subs r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #3
	movs r1, #0x10
	movs r2, #0
	bl SetBlendConfig
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0
	ldrsh r3, [r6, r2]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #2
	movs r2, #0
	bl sub_8012E84
	adds r7, r0, #0
	cmp r7, #0
	bge _080ACC98
	adds r0, r7, #3
_080ACC98:
	asrs r0, r0, #2
	movs r1, #0x40
	subs r1, r1, r0
	add r0, sp, #4
	ldr r3, [sp, #0x14]
	ldr r2, [r3, #0x34]
	rsbs r5, r2, #0
	strh r5, [r0]
	ldr r4, [r3, #0x38]
	rsbs r3, r4, #0
	strh r3, [r0, #2]
	strh r2, [r0, #4]
	strh r3, [r0, #6]
	strh r2, [r0, #8]
	strh r4, [r0, #0xa]
	strh r5, [r0, #0xc]
	strh r4, [r0, #0xe]
	str r6, [sp, #0x18]
	ldr r4, _080ACDE0 @ =0x02000504
	mov sl, r4
	ldr r2, _080ACDE4 @ =0x080DC15C
	movs r0, #0xff
	ands r1, r0
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	mov sb, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	mov r8, r1
	add r6, sp, #4
	movs r5, #3
	mov ip, r5
_080ACCDC:
	mov r0, sb
	movs r1, #0
	ldrsh r5, [r0, r1]
	movs r2, #0
	ldrsh r4, [r6, r2]
	adds r2, r5, #0
	muls r2, r4, r2
	mov r3, r8
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #2
	ldrsh r3, [r6, r0]
	adds r0, r1, #0
	muls r0, r3, r0
	subs r2, r2, r0
	muls r1, r4, r1
	adds r0, r5, #0
	muls r0, r3, r0
	adds r1, r1, r0
	adds r0, r2, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x78
	strh r0, [r6]
	adds r0, r1, #0
	muls r0, r7, r0
	asrs r0, r0, #0x14
	adds r0, #0x50
	strh r0, [r6, #2]
	adds r6, #4
	movs r1, #1
	rsbs r1, r1, #0
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _080ACCDC
	mov r3, sl
	ldr r0, [r3]
	bl InitWindowScanlineBounds
	mov r4, sl
	ldr r0, [r4]
	add r1, sp, #4
	movs r5, #0
	ldrsh r1, [r1, r5]
	add r2, sp, #4
	movs r3, #2
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #4
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #6
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80132A8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #4
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #6
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #8
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xa
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80132A8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #8
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xa
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0xc
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #0xe
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80132A8
	mov r1, sl
	ldr r0, [r1]
	add r1, sp, #4
	movs r2, #0xc
	ldrsh r1, [r1, r2]
	add r2, sp, #4
	movs r3, #0xe
	ldrsh r2, [r2, r3]
	add r3, sp, #4
	movs r4, #0
	ldrsh r3, [r3, r4]
	add r4, sp, #4
	movs r5, #2
	ldrsh r4, [r4, r5]
	str r4, [sp]
	bl sub_80132A8
	bl InitMinimapWindowBuffers
	ldr r1, [sp, #0x18]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _080ACDCE
	ldr r0, [sp, #0x14]
	bl sub_8002DE4
_080ACDCE:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ACDE0: .4byte 0x02000504
_080ACDE4: .4byte 0x080DC15C

