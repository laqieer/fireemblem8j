	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set FillBGRect, 0x080732A0 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8056130, 0x08056130 + 1
	.section .text.sub_805DE74, "ax", %progbits
@ sub_805DE74 @ JP 0x0805DE74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805DE74
	.thumb_func
sub_805DE74:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r2, [r6, #0x44]
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_8012E84
	ldr r4, _0805DEAC @ =0x03003020
	strh r0, [r4, #0x20]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805DEB0
	ldrh r0, [r4, #0x20]
	lsrs r0, r0, #3
	adds r7, r0, #0
	adds r7, #0x1e
	b _0805DEB6
	.align 2, 0
_0805DEAC: .4byte 0x03003020
_0805DEB0:
	ldrh r0, [r4, #0x20]
	lsrs r0, r0, #3
	subs r7, r0, #1
_0805DEB6:
	movs r2, #0x1f
	mov r8, r2
	adds r0, r7, #0
	ands r0, r2
	lsls r0, r0, #1
	ldr r5, _0805DF38 @ =0x020234A8
	adds r0, r0, r5
	movs r4, #0x80
	lsls r4, r4, #1
	str r4, [sp]
	movs r1, #1
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	adds r0, r7, #1
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	str r4, [sp]
	movs r1, #1
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	adds r0, r7, #2
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	str r4, [sp]
	movs r1, #1
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	movs r0, #2
	bl BG_EnableSyncByMask
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble _0805DF2A
	ldr r1, _0805DF3C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056130
	adds r0, r6, #0
	bl sub_8002DE4
_0805DF2A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805DF38: .4byte 0x020234A8
_0805DF3C: .4byte 0x0201774C

