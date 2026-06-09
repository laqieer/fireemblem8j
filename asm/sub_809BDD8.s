	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set __udivsi3, 0x080D67D0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_808B7E0, 0x0808B7E0 + 1
	.set sub_809A868, 0x0809A868 + 1
	.set sub_809AF14, 0x0809AF14 + 1
	.set sub_809C178, 0x0809C178 + 1
	.set sub_809C7D4, 0x0809C7D4 + 1
	.set sub_80B1474, 0x080B1474 + 1
	.set sub_80B1584, 0x080B1584 + 1
	.set sub_80B18C0, 0x080B18C0 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809BDD8, "ax", %progbits
@ sub_809BDD8 @ JP 0x0809BDD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809BDD8
	.thumb_func
sub_809BDD8:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	movs r0, #1
	movs r1, #0
	movs r2, #4
	bl BG_SetPosition
	movs r0, #1
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #2
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	ldr r0, _0809BF1C @ =0x02022CA8
	movs r1, #0x1f
	movs r2, #8
	movs r3, #0
	bl j_TmFillRect
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809AF14
	ldr r0, _0809BF20 @ =0x08A98350
	ldr r5, _0809BF24 @ =0x02020188
	adds r1, r5, #0
	bl sub_8013008
	ldr r4, _0809BF28 @ =0x020234A8
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl j_TmApplyTsa
	ldr r0, _0809BF2C @ =0x08A98428
	adds r1, r5, #0
	bl sub_8013008
	ldr r0, _0809BF30 @ =0x0000025E
	adds r4, r4, r0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl j_TmApplyTsa
	mov r1, r8
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	mov r6, r8
	adds r6, #0x2a
	ldrb r5, [r6]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	mov r2, r8
	ldrh r0, [r2, #0x34]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl sub_80B1FBC
	mov r0, r8
	movs r1, #0
	bl sub_809C7D4
	movs r0, #7
	bl BG_EnableSyncByMask
	mov r4, r8
	adds r4, #0x2b
	ldrb r0, [r4]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _0809BF34 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_809C178
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _0809BF38 @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xb4
	movs r3, #0x4c
	bl sub_809C178
	ldrb r5, [r4]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	mov r1, r8
	ldrh r0, [r1, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80B1474
	ldr r0, _0809BF3C @ =sub_809BD80
	movs r1, #1
	mov r2, r8
	bl sub_80B18C0
	bl sub_80B1584
	bl sub_809A868
	bl sub_808B7E0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809BF1C: .4byte 0x02022CA8
_0809BF20: .4byte 0x08A98350
_0809BF24: .4byte 0x02020188
_0809BF28: .4byte 0x020234A8
_0809BF2C: .4byte 0x08A98428
_0809BF30: .4byte 0x0000025E
_0809BF34: .4byte 0x00000503
_0809BF38: .4byte 0x00000502
_0809BF3C: .4byte 0x0809BD81  @ sub_809BD80

