	.syntax unified
	.section .text.sub_8042330, "ax", %progbits
@ sub_8042330 @ JP 0x08042330 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042330
	.thumb_func
sub_8042330:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r1, [sp, #4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0
	mov r8, r0
	movs r1, #0
	str r1, [sp, #0xc]
	ldr r2, _080423AC @ =0x030017F0
	ldr r7, [sp]
	lsls r3, r7, #1
	adds r4, r3, r2
	ldr r0, _080423B0 @ =0x030017F8
	adds r7, r3, r0
	ldrh r1, [r4]
	ldrh r5, [r7]
	mov sl, r2
	cmp r1, r5
	beq _08042436
	ldr r0, _080423B4 @ =0x0203CA20
	ldrh r2, [r4]
	lsls r1, r2, #3
	adds r1, r3, r1
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r6, _080423B8 @ =0x00004FFF
	mov sb, r0
	cmp r1, r6
	beq _080423C0
	cmp r2, r5
	beq _080423EE
	adds r1, r3, #0
	adds r3, r4, #0
	mov ip, sb
	adds r5, r6, #0
	adds r4, r7, #0
_08042384:
	ldrh r0, [r3]
	adds r0, #1
	ldr r2, _080423BC @ =0x000001FF
	ands r0, r2
	strh r0, [r3]
	ldrh r2, [r3]
	lsls r0, r2, #3
	adds r0, r1, r0
	add r0, ip
	ldrh r0, [r0]
	cmp r0, r5
	bne _080423A2
	ldrh r7, [r4]
	cmp r2, r7
	bne _080423C0
_080423A2:
	ldrh r0, [r4]
	cmp r2, r0
	bne _08042384
	b _080423EE
	.align 2, 0
_080423AC: .4byte 0x030017F0
_080423B0: .4byte 0x030017F8
_080423B4: .4byte 0x0203CA20
_080423B8: .4byte 0x00004FFF
_080423BC: .4byte 0x000001FF
_080423C0:
	ldr r1, [sp]
	lsls r0, r1, #1
	ldr r2, _080423E0 @ =0x030017F8
	adds r1, r0, r2
	mov r3, sl
	adds r2, r0, r3
	ldrh r1, [r1]
	ldrh r2, [r2]
	adds r4, r0, #0
	cmp r1, r2
	bhs _080423E4
	movs r7, #0x80
	lsls r7, r7, #2
	adds r0, r1, r7
	subs r0, r0, r2
	b _080423E6
	.align 2, 0
_080423E0: .4byte 0x030017F8
_080423E4:
	subs r0, r1, r2
_080423E6:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #4
	bhi _080423F4
_080423EE:
	movs r0, #4
	rsbs r0, r0, #0
	b _080424DC
_080423F4:
	mov r2, sl
	adds r0, r4, r2
	ldrh r0, [r0]
	adds r3, r0, #1
	ldr r0, _08042408 @ =0x000001FF
	cmp r3, r0
	bgt _0804240C
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	b _0804240E
	.align 2, 0
_08042408: .4byte 0x000001FF
_0804240C:
	movs r0, #0
_0804240E:
	lsls r0, r0, #3
	adds r0, r4, r0
	add r0, sb
	ldrh r6, [r0]
	cmp r6, #0x80
	bls _08042430
	mov r3, sl
	adds r0, r4, r3
	ldrh r1, [r0]
	adds r1, #1
	ldr r2, _0804242C @ =0x000001FF
	ands r1, r2
	strh r1, [r0]
	b _080423EE
	.align 2, 0
_0804242C: .4byte 0x000001FF
_08042430:
	adds r0, r6, #6
	cmp r0, r1
	ble _0804243C
_08042436:
	movs r0, #2
	rsbs r0, r0, #0
	b _080424DC
_0804243C:
	mov r7, sl
	adds r2, r4, r7
	ldrh r0, [r2]
	adds r0, #2
	ldr r7, _080424D0 @ =0x000001FF
	ands r0, r7
	strh r0, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	add r0, sb
	ldrh r0, [r0]
	str r0, [sp, #8]
	adds r1, #1
	ands r1, r7
	strh r1, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	add r0, sb
	ldrh r0, [r0]
	mov sl, r0
	adds r1, #1
	ands r1, r7
	strh r1, [r2]
	ldr r0, _080424D4 @ =0x00004FFF
	add r0, r8
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r3, #0
	cmp r3, r6
	bge _080424BE
	mov ip, r4
	adds r5, r2, #0
	ldr r4, [sp, #4]
_08042486:
	ldrh r0, [r5]
	lsls r0, r0, #3
	add r0, ip
	add r0, sb
	ldrh r2, [r0]
	adds r3, #1
	adds r1, r2, #0
	muls r1, r3, r1
	mov r7, r8
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mvns r1, r1
	ldr r0, [sp, #0xc]
	adds r1, r0, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	strh r2, [r4]
	ldrh r0, [r5]
	adds r0, #1
	ldr r1, _080424D0 @ =0x000001FF
	ands r0, r1
	strh r0, [r5]
	adds r4, #2
	cmp r3, r6
	blt _08042486
_080424BE:
	ldr r2, [sp, #8]
	cmp r8, r2
	bne _080424CA
	ldr r3, [sp, #0xc]
	cmp r3, sl
	beq _080424D8
_080424CA:
	movs r0, #3
	rsbs r0, r0, #0
	b _080424DC
	.align 2, 0
_080424D0: .4byte 0x000001FF
_080424D4: .4byte 0x00004FFF
_080424D8:
	lsls r0, r6, #0x11
	asrs r0, r0, #0x10
_080424DC:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

