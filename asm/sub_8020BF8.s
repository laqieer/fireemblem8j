	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set MaybeResetSomePal, 0x0800169C + 1
	.set MaybeSmoothChangeSomePal, 0x080016B8 + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set StartBgm, 0x08002424 + 1
	.set j_ColorFadeTick, 0x080DC0EC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8020BF8, "ax", %progbits
@ sub_8020BF8 @ JP 0x08020BF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8020BF8
	.thumb_func
sub_8020BF8:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _08020CC4 @ =0x03003020
	ldrb r1, [r2]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _08020CC8 @ =0x01000008
	mov r0, sp
	bl sub_80D636C
	ldr r0, _08020CCC @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _08020CD0 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _08020CD4 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #7
	bl BG_EnableSyncByMask
	ldr r0, _08020CD8 @ =0x085C3560
	bl Proc_EndEach
	ldr r0, _08020CDC @ =0x085C3588
	bl Proc_EndEach
	ldr r0, _08020CE0 @ =0x085C35E0
	bl Proc_EndEach
	bl MaybeResetSomePal
	ldr r5, _08020CE4 @ =0x02022968
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #2
	bl MaybeSmoothChangeSomePal
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x1a
	movs r2, #6
	movs r3, #2
	bl MaybeSmoothChangeSomePal
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r1, #0x10
	movs r2, #2
	movs r3, #2
	bl MaybeSmoothChangeSomePal
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x17
	movs r2, #1
	movs r3, #2
	bl MaybeSmoothChangeSomePal
	bl j_ColorFadeTick
	bl sub_8001EE4
	adds r4, #0x4c
	movs r0, #0xe
	strh r0, [r4]
	ldr r4, _08020CE8 @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrh r1, [r0, #0x28]
	ldr r0, _08020CEC @ =0x0000FFFF
	cmp r1, r0
	beq _08020CBC
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrh r0, [r0, #0x28]
	movs r1, #0
	bl StartBgm
_08020CBC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020CC4: .4byte 0x03003020
_08020CC8: .4byte 0x01000008
_08020CCC: .4byte 0x02022CA8
_08020CD0: .4byte 0x020234A8
_08020CD4: .4byte 0x02023CA8
_08020CD8: .4byte 0x085C3560
_08020CDC: .4byte 0x085C3588
_08020CE0: .4byte 0x085C35E0
_08020CE4: .4byte 0x02022968
_08020CE8: .4byte 0x0202BCEC
_08020CEC: .4byte 0x0000FFFF

