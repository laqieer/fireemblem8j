	.syntax unified
	.set FaceRefreshSprite, 0x080056C8 + 1
	.set GetPortraitData, 0x0800541C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80063F8, "ax", %progbits
@ sub_80063F8 @ JP 0x080063F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80063F8
	.thumb_func
sub_80063F8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov sb, r1
	mov sl, r2
	str r3, [sp, #4]
	ldr r1, _0800641C @ =0x03004920
	lsls r0, r7, #2
	adds r4, r0, r1
	ldr r6, [r4]
	cmp r6, #0
	beq _08006420
	movs r0, #0
	b _08006506
	.align 2, 0
_0800641C: .4byte 0x03004920
_08006420:
	ldr r0, _08006460 @ =0x085B8F24
	movs r1, #5
	bl sub_8002BCC
	adds r5, r0, #0
	str r5, [r4]
	mov r0, sb
	bl GetPortraitData
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, [sp, #0x28]
	ands r0, r1
	cmp r0, #0
	beq _08006470
	str r6, [sp]
	ldr r0, _08006464 @ =0x0202A688
	lsls r4, r7, #3
	adds r0, r4, r0
	ldrh r1, [r0, #4]
	lsls r1, r1, #5
	ldr r0, _08006468 @ =0x02022AA8
	adds r1, r1, r0
	ldr r2, _0800646C @ =0x01000008
	mov r0, sp
	bl sub_80D636C
	bl sub_8001EE4
	b _08006486
	.align 2, 0
_08006460: .4byte 0x085B8F24
_08006464: .4byte 0x0202A688
_08006468: .4byte 0x02022AA8
_0800646C: .4byte 0x01000008
_08006470:
	mov r2, r8
	ldr r0, [r2, #8]
	ldr r1, _080064CC @ =0x0202A688
	lsls r4, r7, #3
	adds r1, r4, r1
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
_08006486:
	mov r0, r8
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strb r7, [r0]
	mov r2, sb
	strh r2, [r5, #0x3e]
	adds r2, r5, #0
	adds r2, #0x41
	movs r0, #5
	strb r0, [r2]
	mov r0, sl
	strh r0, [r5, #0x34]
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r5, #0x36]
	str r1, [r5, #0x44]
	str r1, [r5, #0x48]
	ldr r0, [sp, #0x28]
	str r0, [r5, #0x30]
	adds r0, r5, #0
	bl FaceRefreshSprite
	movs r1, #0xf0
	lsls r1, r1, #2
	ldr r2, [sp, #0x28]
	ands r1, r2
	cmp r1, #0x80
	beq _080064DE
	cmp r1, #0x80
	bgt _080064D0
	cmp r1, #0x40
	beq _080064DA
	b _080064EA
	.align 2, 0
_080064CC: .4byte 0x0202A688
_080064D0:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq _080064E4
	b _080064EA
_080064DA:
	movs r3, #0
	b _080064EE
_080064DE:
	movs r3, #0x80
	lsls r3, r3, #3
	b _080064EE
_080064E4:
	movs r3, #0xc0
	lsls r3, r3, #4
	b _080064EE
_080064EA:
	movs r3, #0x80
	lsls r3, r3, #4
_080064EE:
	ldr r0, _08006518 @ =0x0202A688
	adds r0, r4, r0
	ldr r1, [r0]
	lsrs r1, r1, #5
	ldrh r2, [r0, #4]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r1, r1, r3
	strh r1, [r5, #0x3c]
	adds r0, r5, #0
_08006506:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08006518: .4byte 0x0202A688

