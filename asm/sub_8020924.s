	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set MaybeResetSomePal, 0x0800169C + 1
	.set MaybeSmoothChangeSomePal, 0x080016B8 + 1
	.set WfxFlamesInitGradientPublic, 0x080306A8 + 1
	.set j_ColorFadeTick, 0x080DC0EC + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_8020924, "ax", %progbits
@ sub_8020924 @ JP 0x08020924 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8020924
	.thumb_func
sub_8020924:
	push {r4, r5, lr}
	adds r4, r0, #0
	bl MaybeResetSomePal
	ldr r5, _08020994 @ =0x02022968
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #1
	bl MaybeSmoothChangeSomePal
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x1a
	movs r2, #6
	movs r3, #1
	bl MaybeSmoothChangeSomePal
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r1, #0x10
	movs r2, #2
	movs r3, #1
	bl MaybeSmoothChangeSomePal
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x17
	movs r2, #1
	movs r3, #1
	bl MaybeSmoothChangeSomePal
	bl j_ColorFadeTick
	bl sub_8001EE4
	adds r4, #0x4c
	movs r0, #0x1e
	strh r0, [r4]
	ldr r0, _08020998 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _0802098E
	bl WfxFlamesInitGradientPublic
_0802098E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020994: .4byte 0x02022968
_08020998: .4byte 0x0202BCEC

