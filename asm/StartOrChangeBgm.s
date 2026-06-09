	.syntax unified
	.set DeleteAll6CWaitMusicRelated, 0x08002A08 + 1
	.set GetCurrentBgmSong, 0x080021A8 + 1
	.set StartSongDelayed, 0x080027A8 + 1
	.set sub_800226C, 0x0800226C + 1
	.set sub_8002398, 0x08002398 + 1
	.section .text.StartOrChangeBgm, "ax", %progbits
@ StartOrChangeBgm @ JP 0x080023C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StartOrChangeBgm
	.thumb_func
StartOrChangeBgm:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r7, _0800240C @ =0x02024E5C
	movs r0, #6
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _080023E2
	bl GetCurrentBgmSong
	cmp r0, r4
	beq _0800241C
_080023E2:
	ldr r0, _08002410 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0800241C
	bl DeleteAll6CWaitMusicRelated
	movs r0, #6
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _08002414
	adds r0, r5, #0
	bl sub_800226C
	lsls r1, r5, #4
	adds r0, r4, #0
	adds r2, r6, #0
	bl StartSongDelayed
	b _0800241C
	.align 2, 0
_0800240C: .4byte 0x02024E5C
_08002410: .4byte 0x0202BCEC
_08002414:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8002398
_0800241C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

