	.syntax unified
	.set GetPortraitData, 0x0800541C + 1
	.set SetFaceDisplayBits, 0x08005678 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.StartFace, "ax", %progbits
@ StartFace @ JP 0x08005544 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StartFace
	.thumb_func
StartFace:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	mov sl, r3
	ldr r1, _08005568 @ =0x03004920
	lsls r0, r6, #2
	adds r5, r0, r1
	ldr r7, [r5]
	cmp r7, #0
	beq _0800556C
	movs r0, #0
	b _08005628
	.align 2, 0
_08005568: .4byte 0x03004920
_0800556C:
	ldr r0, _080055AC @ =0x085B8EEC
	movs r1, #5
	bl sub_8002BCC
	adds r4, r0, #0
	str r4, [r5]
	mov r0, r8
	bl GetPortraitData
	adds r5, r0, #0
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, [sp, #0x24]
	ands r0, r1
	cmp r0, #0
	beq _080055BC
	str r7, [sp]
	ldr r1, _080055B0 @ =0x0202A688
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	lsls r1, r1, #5
	ldr r0, _080055B4 @ =0x02022AA8
	adds r1, r1, r0
	ldr r2, _080055B8 @ =0x01000008
	mov r0, sp
	bl sub_80D636C
	bl sub_8001EE4
	b _080055D0
	.align 2, 0
_080055AC: .4byte 0x085B8EEC
_080055B0: .4byte 0x0202A688
_080055B4: .4byte 0x02022AA8
_080055B8: .4byte 0x01000008
_080055BC:
	ldr r0, [r5, #8]
	ldr r2, _08005600 @ =0x0202A688
	lsls r1, r6, #3
	adds r1, r1, r2
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
_080055D0:
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x40
	movs r2, #0
	strb r6, [r0]
	mov r0, r8
	strh r0, [r4, #0x3e]
	adds r1, r4, #0
	adds r1, #0x41
	movs r0, #5
	strb r0, [r1]
	mov r1, sb
	strh r1, [r4, #0x34]
	mov r0, sl
	strh r0, [r4, #0x36]
	movs r0, #0x80
	lsls r0, r0, #5
	ldr r1, [sp, #0x24]
	ands r0, r1
	cmp r0, #0
	beq _08005604
	str r2, [r4, #0x44]
	str r2, [r4, #0x48]
	b _08005618
	.align 2, 0
_08005600: .4byte 0x0202A688
_08005604:
	ldr r0, _08005638 @ =0x085B8FE4
	adds r1, r4, #0
	bl sub_8002BCC
	str r0, [r4, #0x44]
	ldr r0, _0800563C @ =0x085B8FFC
	adds r1, r4, #0
	bl sub_8002BCC
	str r0, [r4, #0x48]
_08005618:
	ldr r1, [sp, #0x24]
	mvns r0, r1
	str r0, [r4, #0x30]
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	bl SetFaceDisplayBits
	adds r0, r4, #0
_08005628:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08005638: .4byte 0x085B8FE4
_0800563C: .4byte 0x085B8FFC

