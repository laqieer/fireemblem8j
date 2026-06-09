	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_8056890, 0x08056890 + 1
	.set sub_80733E8, 0x080733E8 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_806804C, "ax", %progbits
@ sub_806804C @ JP 0x0806804C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806804C
	.thumb_func
sub_806804C:
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	adds r0, #0x18
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #0x3c]
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	ldrh r1, [r4, #0x34]
	ldrh r2, [r4, #0x3c]
	movs r0, #1
	bl BG_SetPosition
	movs r0, #2
	bl BG_EnableSyncByMask
	cmp r5, #0
	blt _08068100
	ldr r2, [r4, #0x4c]
	ldr r1, [r4, #0x50]
	ldr r0, _080680A0 @ =0x0203E11C
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _080680A8
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _080680A4 @ =0x02019790
	bl sub_80D6394
	b _080680B4
	.align 2, 0
_080680A0: .4byte 0x0203E11C
_080680A4: .4byte 0x02019790
_080680A8:
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080680D8 @ =0x02019790
	bl sub_80D6394
_080680B4:
	ldr r5, _080680D8 @ =0x02019790
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080680E0
	ldr r1, _080680DC @ =0x020234A8
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl sub_80733E8
	b _080680F4
	.align 2, 0
_080680D8: .4byte 0x02019790
_080680DC: .4byte 0x020234A8
_080680E0:
	ldr r1, _080680FC @ =0x020234A8
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl EfxTmCpyBG
_080680F4:
	movs r0, #2
	bl BG_EnableSyncByMask
	b _0806811E
	.align 2, 0
_080680FC: .4byte 0x020234A8
_08068100:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0806811E
	bl sub_8056130
	ldr r1, _08068128 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	adds r0, r4, #0
	bl sub_8002DE4
_0806811E:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068128: .4byte 0x0201774C

