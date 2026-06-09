	.syntax unified
	.set GetSupportScreenCharIdAt, 0x080A492C + 1
	.set GetSupportScreenPartnerCount, 0x080A5944 + 1
	.set ResetFaces, 0x08005430 + 1
	.set ResetText, 0x08003BC4 + 1
	.set SupportSubScreen_BackupTilemaps, 0x080A58BC + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8005D9C, 0x08005D9C + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80A5C54, 0x080A5C54 + 1
	.set sub_80A5D34, 0x080A5D34 + 1
	.set sub_80A5E18, 0x080A5E18 + 1
	.set sub_80A5E48, 0x080A5E48 + 1
	.set sub_80A5EC8, 0x080A5EC8 + 1
	.set sub_80A5F20, 0x080A5F20 + 1
	.section .text.sub_80A678C, "ax", %progbits
@ sub_80A678C @ JP 0x080A678C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A678C
	.thumb_func
sub_80A678C:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	bl ResetFaces
	bl ResetText
	bl sub_80034C4
	ldr r6, _080A6860 @ =0x02022CA8
	adds r0, r6, #0
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080A6864 @ =0x020234A8
	mov r8, r0
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080A6868 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	adds r2, r4, #0
	adds r2, #0x39
	ldrb r1, [r2]
	movs r0, #0xfc
	ands r0, r1
	movs r1, #0
	mov sb, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl GetSupportScreenCharIdAt
	bl GetSupportScreenPartnerCount
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80A5D34
	adds r0, r4, #0
	bl sub_80A5E18
	adds r0, r4, #0
	bl sub_80A5E48
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl sub_80A5F20
	ldr r0, _080A686C @ =0x08A9AB38
	ldr r5, _080A6870 @ =0x02020188
	adds r1, r5, #0
	bl sub_8013008
	movs r2, #0x80
	lsls r2, r2, #5
	mov r0, r8
	adds r1, r5, #0
	bl j_TmApplyTsa
	ldr r5, _080A6874 @ =0x088582BC
	ldr r0, [r4, #0x2c]
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #6]
	adds r6, #0x44
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8005D9C
	adds r0, r4, #0
	bl sub_80A5EC8
	adds r0, r4, #0
	bl sub_80A5C54
	bl SupportSubScreen_BackupTilemaps
	adds r4, #0x3a
	mov r0, sb
	strb r0, [r4]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6860: .4byte 0x02022CA8
_080A6864: .4byte 0x020234A8
_080A6868: .4byte 0x02023CA8
_080A686C: .4byte 0x08A9AB38
_080A6870: .4byte 0x02020188
_080A6874: .4byte 0x088582BC

