	.syntax unified
	.set GetSaveWriteAddr, 0x080A7AA8 + 1
	.set InvalidateSuspendSave, 0x080AA438 + 1
	.set SGM_SetCharacterKnown, 0x080A81EC + 1
	.set SaveDungeonRecords, 0x08037F78 + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set WriteLastGameSaveId, 0x080A97C4 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_80A776C, 0x080A776C + 1
	.set sub_80A77EC, 0x080A77EC + 1
	.set sub_80A79D8, 0x080A79D8 + 1
	.set sub_80A7B94, 0x080A7B94 + 1
	.set sub_80A7C28, 0x080A7C28 + 1
	.set sub_80A8CA8, 0x080A8CA8 + 1
	.set sub_80A8CCC, 0x080A8CCC + 1
	.set sub_80A9784, 0x080A9784 + 1
	.set sub_80A9D54, 0x080A9D54 + 1
	.set sub_80AA3F8, 0x080AA3F8 + 1
	.set sub_80ABAC8, 0x080ABAC8 + 1
	.section .text.sub_80A9A28, "ax", %progbits
@ sub_80A9A28 @ JP 0x080A9A28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9A28
	.thumb_func
sub_80A9A28:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	mov sl, r0
	bl GetSaveWriteAddr
	adds r7, r0, #0
	movs r0, #3
	bl InvalidateSuspendSave
	ldr r4, _080A9B1C @ =0x0202BCEC
	mov r0, sl
	strb r0, [r4, #0xc]
	bl sub_8000CD8
	str r0, [r4]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x4c
	bl WriteAndVerifySramFast
	add r1, sp, #0x10
	mov r8, r1
	mov r0, sp
	adds r0, #0x74
	str r0, [sp, #0x8c]
	adds r4, r7, #0
	adds r4, #0x4c
	movs r6, #0
	ldr r1, _080A9B20 @ =0x0202BE48
	mov sb, r1
	movs r5, #0x32
_080A9A6E:
	mov r1, sb
	adds r0, r6, r1
	adds r1, r4, #0
	bl sub_80A9D54
	adds r4, #0x24
	adds r6, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A9A6E
	mov r0, r8
	bl sub_80A776C
	movs r4, #0
	ldr r6, _080A9B20 @ =0x0202BE48
	movs r5, #0x32
_080A9A8E:
	adds r0, r4, r6
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	mov r1, r8
	bl SGM_SetCharacterKnown
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A9A8E
	movs r4, #0
	mov r0, r8
	bl sub_80A77EC
	movs r1, #0xef
	lsls r1, r1, #3
	adds r0, r7, r1
	bl sub_80AA3F8
	ldr r1, _080A9B24 @ =0x0000079C
	adds r0, r7, r1
	bl sub_80A7C28
	ldr r1, _080A9B28 @ =0x0000084C
	adds r0, r7, r1
	bl sub_80A8CA8
	ldr r1, _080A9B2C @ =0x00000CAC
	adds r0, r7, r1
	bl sub_80A8CCC
	adds r0, r7, #0
	bl sub_80A9784
	ldr r1, _080A9B30 @ =0x00000D6C
	adds r0, r7, r1
	bl sub_80A7B94
	ldr r1, _080A9B34 @ =0x00000D8C
	adds r0, r7, r1
	ldr r1, _080A9B38 @ =0x03005270
	bl sub_80ABAC8
	ldr r0, [sp, #0x8c]
	bl SaveDungeonRecords
	movs r0, #0xdb
	lsls r0, r0, #4
	adds r1, r7, r0
	ldr r0, [sp, #0x8c]
	movs r2, #0x18
	bl WriteAndVerifySramFast
	ldr r0, _080A9B3C @ =0x00040624
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #6]
	mov r1, sl
	bl sub_80A79D8
	mov r0, sl
	bl WriteLastGameSaveId
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9B1C: .4byte 0x0202BCEC
_080A9B20: .4byte 0x0202BE48
_080A9B24: .4byte 0x0000079C
_080A9B28: .4byte 0x0000084C
_080A9B2C: .4byte 0x00000CAC
_080A9B30: .4byte 0x00000D6C
_080A9B34: .4byte 0x00000D8C
_080A9B38: .4byte 0x03005270
_080A9B3C: .4byte 0x00040624

