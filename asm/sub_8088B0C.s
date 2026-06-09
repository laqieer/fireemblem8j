	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_8088B0C, "ax", %progbits
@ sub_8088B0C @ JP 0x08088B0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8088B0C
	.thumb_func
sub_8088B0C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r7, _08088BD0 @ =0x02022968
	movs r0, #0
	mov sb, r0
	movs r1, #0x1f
	mov sl, r1
	movs r2, #0x80
	lsls r2, r2, #0xd
	mov r8, r2
_08088B26:
	ldrh r0, [r7]
	movs r6, #0x1f
	ands r6, r0
	lsrs r1, r0, #5
	mov r2, sl
	ands r1, r2
	lsrs r2, r0, #0xa
	mov r0, sl
	ands r2, r0
	lsls r4, r6, #3
	adds r4, r4, r6
	lsls r0, r4, #4
	adds r4, r4, r0
	lsls r4, r4, #1
	ldr r0, _08088BD4 @ =0x00000259
	muls r0, r1, r0
	adds r4, r4, r0
	movs r0, #0x75
	muls r0, r2, r0
	adds r4, r4, r0
	lsls r4, r4, #0xa
	ldr r1, _08088BD8 @ =0x0029BDDC
	adds r0, r4, r1
	mov r1, r8
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r2, _08088BDC @ =0xFFFBEDED
	adds r0, r4, r2
	mov r1, r8
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	ldr r0, _08088BE0 @ =0xFFC71C6D
	adds r4, r4, r0
	adds r0, r4, #0
	mov r1, r8
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r6, #0
	bge _08088B82
	movs r6, #0
_08088B82:
	cmp r5, #0
	bge _08088B88
	movs r5, #0
_08088B88:
	cmp r2, #0
	bge _08088B8E
	movs r2, #0
_08088B8E:
	cmp r6, #0x1f
	ble _08088B94
	movs r6, #0x1f
_08088B94:
	cmp r5, #0x1f
	ble _08088B9A
	movs r5, #0x1f
_08088B9A:
	cmp r2, #0x1f
	ble _08088BA0
	movs r2, #0x1f
_08088BA0:
	lsls r0, r6, #0x10
	lsls r1, r5, #0x15
	orrs r1, r0
	lsls r0, r2, #0x1a
	orrs r0, r1
	lsrs r0, r0, #0x10
	strh r0, [r7]
	adds r7, #2
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #0x9f
	bls _08088B26
	bl sub_8001EE4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088BD0: .4byte 0x02022968
_08088BD4: .4byte 0x00000259
_08088BD8: .4byte 0x0029BDDC
_08088BDC: .4byte 0xFFFBEDED
_08088BE0: .4byte 0xFFC71C6D

