	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_809DAF4, 0x0809DAF4 + 1
	.set sub_809F6B4, 0x0809F6B4 + 1
	.set sub_809F718, 0x0809F718 + 1
	.section .text.sub_80A04B8, "ax", %progbits
@ sub_80A04B8 @ JP 0x080A04B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A04B8
	.thumb_func
sub_80A04B8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl sub_80034C4
	ldr r0, _080A0550 @ =0x02023CC6
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r1, [r0]
	lsrs r1, r1, #4
	mov r0, r8
	bl sub_809F6B4
	ldr r0, _080A0554 @ =0x02022EEC
	ldr r1, [r4, #0x2c]
	bl sub_809DAF4
	movs r0, #5
	bl BG_EnableSyncByMask
	cmp r7, #0
	bge _080A050A
	ldr r0, _080A0558 @ =0x02013690
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_809F718
_080A050A:
	cmp r7, #0
	ble _080A0524
	ldr r0, _080A0558 @ =0x02013690
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_809F718
_080A0524:
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r0, [r1]
	adds r0, r0, r7
	strh r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0550: .4byte 0x02023CC6
_080A0554: .4byte 0x02022EEC
_080A0558: .4byte 0x02013690

