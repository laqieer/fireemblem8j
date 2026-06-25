.syntax unified
glabel PutFaceOnBackGround
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	ldr r3, _08006674 @ =0x080DC43C
	cmp r2, #0
	bne _08006696
	movs r2, #0
	ldr r1, _08006678 @ =0x0000FFFF
	mov r8, r1
	movs r1, #0
	mov ip, r1
_0800665A:
	adds r4, r3, #0
	adds r4, #0x18
	adds r6, r0, #0
	adds r6, #0x40
	adds r5, r2, #1
	adds r2, r0, #0
	movs r1, #0xb
_08006668:
	ldrh r0, [r3]
	cmp r0, r8
	bne _0800667C
	mov r0, ip
	b _0800667E
	.align 2, 0
_08006674: .4byte 0x080DC43C
_08006678: .4byte 0x0000FFFF
_0800667C:
	adds r0, r7, r0
_0800667E:
	strh r0, [r2]
	adds r2, #2
	adds r3, #2
	subs r1, #1
	cmp r1, #0
	bge _08006668
	adds r3, r4, #0
	adds r0, r6, #0
	adds r2, r5, #0
	cmp r2, #9
	ble _0800665A
	b _080066DE
_08006696:
	movs r2, #0
	ldr r1, _080066C0 @ =0x0000FFFF
	mov sb, r1
	movs r1, #0
	mov ip, r1
	movs r1, #0x80
	lsls r1, r1, #3
	mov r8, r1
_080066A6:
	adds r4, r3, #0
	adds r4, #0x18
	adds r6, r0, #0
	adds r6, #0x40
	adds r5, r2, #1
	adds r2, r0, #0
	adds r3, #0x16
	movs r1, #0xb
_080066B6:
	ldrh r0, [r3]
	cmp r0, sb
	bne _080066C4
	mov r0, ip
	b _080066C8
	.align 2, 0
_080066C0: .4byte 0x0000FFFF
_080066C4:
	adds r0, r7, r0
	add r0, r8
_080066C8:
	strh r0, [r2]
	adds r2, #2
	subs r3, #2
	subs r1, #1
	cmp r1, #0
	bge _080066B6
	adds r3, r4, #0
	adds r0, r6, #0
	adds r2, r5, #0
	cmp r2, #9
	ble _080066A6
_080066DE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

