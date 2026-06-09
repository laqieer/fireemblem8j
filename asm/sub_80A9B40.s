	.syntax unified
	.set GetSaveReadAddr, 0x080A7B58 + 1
	.set InitUnits, 0x0801756C + 1
	.set InvalidateSuspendSave, 0x080AA438 + 1
	.set LoadDungeonRecords, 0x08037F90 + 1
	.set ReadGMMonsterRnState, 0x080AA418 + 1
	.set WriteLastGameSaveId, 0x080A97C4 + 1
	.set sub_8000CE4, 0x08000CE4 + 1
	.set sub_80A7BDC, 0x080A7BDC + 1
	.set sub_80A7CB0, 0x080A7CB0 + 1
	.set sub_80A8C60, 0x080A8C60 + 1
	.set sub_80A8C8C, 0x080A8C8C + 1
	.set sub_80A97A0, 0x080A97A0 + 1
	.set sub_80AA1AC, 0x080AA1AC + 1
	.set sub_80ABB50, 0x080ABB50 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A9B40, "ax", %progbits
@ sub_80A9B40 @ JP 0x080A9B40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9B40
	.thumb_func
sub_80A9B40:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	mov sb, r0
	bl GetSaveReadAddr
	adds r7, r0, #0
	ldr r0, _080A9C08 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080A9B64
	movs r0, #3
	bl InvalidateSuspendSave
_080A9B64:
	ldr r0, _080A9C0C @ =0x03006790
	ldr r4, _080A9C10 @ =0x0202BCEC
	ldr r3, [r0]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x4c
	bl sub_80D65C8
	ldr r0, [r4]
	bl sub_8000CE4
	mov r0, sb
	strb r0, [r4, #0xc]
	bl InitUnits
	movs r6, #0
	adds r4, r7, #0
	adds r4, #0x4c
	ldr r1, _080A9C14 @ =0x0202BE48
	mov r8, r1
	movs r5, #0x32
_080A9B8E:
	mov r2, r8
	adds r1, r6, r2
	adds r0, r4, #0
	bl sub_80AA1AC
	adds r6, #0x48
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A9B8E
	movs r1, #0xef
	lsls r1, r1, #3
	adds r0, r7, r1
	bl ReadGMMonsterRnState
	ldr r2, _080A9C18 @ =0x0000079C
	adds r0, r7, r2
	bl sub_80A7CB0
	ldr r1, _080A9C1C @ =0x00000D6C
	adds r0, r7, r1
	bl sub_80A7BDC
	ldr r2, _080A9C20 @ =0x0000084C
	adds r0, r7, r2
	bl sub_80A8C60
	ldr r1, _080A9C24 @ =0x00000CAC
	adds r0, r7, r1
	bl sub_80A8C8C
	adds r0, r7, #0
	bl sub_80A97A0
	ldr r2, _080A9C28 @ =0x00000D8C
	adds r0, r7, r2
	ldr r1, _080A9C2C @ =0x03005270
	bl sub_80ABB50
	ldr r1, _080A9C0C @ =0x03006790
	movs r2, #0xdb
	lsls r2, r2, #4
	adds r0, r7, r2
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x18
	bl sub_80D65C8
	mov r0, sp
	bl LoadDungeonRecords
	mov r0, sb
	bl WriteLastGameSaveId
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9C08: .4byte 0x0202BCAC
_080A9C0C: .4byte 0x03006790
_080A9C10: .4byte 0x0202BCEC
_080A9C14: .4byte 0x0202BE48
_080A9C18: .4byte 0x0000079C
_080A9C1C: .4byte 0x00000D6C
_080A9C20: .4byte 0x0000084C
_080A9C24: .4byte 0x00000CAC
_080A9C28: .4byte 0x00000D8C
_080A9C2C: .4byte 0x03005270

