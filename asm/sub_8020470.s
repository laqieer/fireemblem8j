	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetChapterTitleWM, 0x0808BAAC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_808B824, 0x0808B824 + 1
	.set sub_808B8DC, 0x0808B8DC + 1
	.set sub_808B9C0, 0x0808B9C0 + 1
	.section .text.sub_8020470, "ax", %progbits
@ sub_8020470 @ JP 0x08020470 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8020470
	.thumb_func
sub_8020470:
	push {r4, r5, lr}
	ldr r4, _080204B4 @ =0x02022CA8
	movs r1, #0x94
	lsls r1, r1, #5
	adds r0, r4, #0
	bl sub_80011D0
	movs r0, #8
	movs r1, #5
	bl sub_808B824
	ldr r0, _080204B8 @ =0x0202BCEC
	bl GetChapterTitleWM
	adds r5, r0, #0
	movs r0, #0xa0
	lsls r0, r0, #2
	adds r1, r5, #0
	bl sub_808B8DC
	ldr r0, _080204BC @ =0x00000246
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #5
	adds r2, r5, #0
	bl sub_808B9C0
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080204B4: .4byte 0x02022CA8
_080204B8: .4byte 0x0202BCEC
_080204BC: .4byte 0x00000246

