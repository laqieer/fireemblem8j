	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80D2EBC, 0x080D2EBC + 1
	.section .text.sub_80D3554, "ax", %progbits
@ sub_80D3554 @ JP 0x080D3554 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D3554
	.thumb_func
sub_80D3554:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sb, r1
	movs r4, #0xa0
	ldr r0, _080D3578 @ =0x08BABAF4
	ldr r0, [r0]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D357C
	cmp r0, #1
	beq _080D35E0
	b _080D363C
	.align 2, 0
_080D3578: .4byte 0x08BABAF4
_080D357C:
	movs r0, #0
	ldr r7, _080D35DC @ =0x020234A8
_080D3580:
	movs r1, #0x40
	adds r1, r1, r4
	mov ip, r1
	adds r6, r0, #1
	adds r3, r4, #0
	adds r3, #0x62
	adds r2, r4, #0
	adds r2, #0x22
	adds r1, r4, #0
	adds r1, #0x42
	adds r0, r4, #2
	movs r5, #7
	lsls r0, r0, #1
	adds r4, r0, r7
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r3, r3, #1
	adds r3, r3, r7
_080D35A8:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r1, #2
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _080D35A8
	mov r4, ip
	adds r0, r6, #0
	cmp r0, #4
	ble _080D3580
	mov r0, sb
	movs r1, #6
	bl __modsi3
	adds r1, r0, #0
	mov r0, sb
	movs r2, #0xf
	bl sub_80D2EBC
	b _080D363C
	.align 2, 0
_080D35DC: .4byte 0x020234A8
_080D35E0:
	movs r0, #0
	ldr r1, _080D3650 @ =0x08BABC64
	mov sl, r1
	ldr r7, _080D3654 @ =0x020234A8
_080D35E8:
	movs r1, #0x40
	adds r1, r1, r4
	mov ip, r1
	adds r6, r0, #1
	adds r3, r4, #0
	adds r3, #0x6a
	adds r2, r4, #0
	adds r2, #0x2a
	adds r1, r4, #0
	adds r1, #0x4a
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0x12
	lsls r0, r0, #1
	adds r4, r0, r7
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r3, r3, #1
	adds r3, r3, r7
_080D3612:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r1, #2
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _080D3612
	mov r4, ip
	adds r0, r6, #0
	cmp r0, #4
	ble _080D35E8
	mov r0, sl
	mov r1, r8
	bl sub_8002BCC
	mov r1, sb
	str r1, [r0, #0x34]
_080D363C:
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D3650: .4byte 0x08BABC64
_080D3654: .4byte 0x020234A8

