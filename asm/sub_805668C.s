	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set sub_80733E8, 0x080733E8 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_805668C, "ax", %progbits
@ sub_805668C @ JP 0x0805668C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805668C
	.thumb_func
sub_805668C:
	push {r4, lr}
	sub sp, #8
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080566AC @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080566B4
	ldr r1, _080566B0 @ =0x02019790
	adds r0, r3, #0
	bl sub_80D6394
	b _080566BC
	.align 2, 0
_080566AC: .4byte 0x0203E11C
_080566B0: .4byte 0x02019790
_080566B4:
	ldr r1, _080566D8 @ =0x02019790
	adds r0, r2, #0
	bl sub_80D6394
_080566BC:
	ldr r2, _080566D8 @ =0x02019790
	cmp r4, #0
	bne _080566E0
	ldr r1, _080566DC @ =0x020234A8
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl sub_80733E8
	b _080566F4
	.align 2, 0
_080566D8: .4byte 0x02019790
_080566DC: .4byte 0x020234A8
_080566E0:
	ldr r1, _08056704 @ =0x020234A8
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_080566F4:
	movs r0, #2
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056704: .4byte 0x020234A8

