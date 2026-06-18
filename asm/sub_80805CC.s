	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8001570, 0x08001570 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.section .text.sub_80805CC, "ax", %progbits
@ MapAnimMonsterStone_Loop1 @ JP 0x080805CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MapAnimMonsterStone_Loop1
	.thumb_func
MapAnimMonsterStone_Loop1:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _08080652
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _080805F4
	ldr r0, _080805F0 @ =0x000003BA
	ldr r1, [r4, #0x30]
	bl sub_8014B50
	b _080805FE
	.align 2, 0
_080805F0: .4byte 0x000003BA
_080805F4:
	cmp r1, #9
	bls _080805FE
	adds r0, r4, #0
	bl sub_8002DE4
_080805FE:
	ldr r0, _08080664 @ =0x08A14414
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r6, _08080668 @ =0x02020188
	adds r1, r6, #0
	bl sub_8013008
	ldr r1, _0808066C @ =0x02023CA8
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _0808061A
	adds r0, #7
_0808061A:
	asrs r0, r0, #3
	subs r0, #4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r4, #0x34]
	cmp r3, #0
	bge _0808062A
	adds r3, #7
_0808062A:
	asrs r3, r3, #3
	subs r3, #4
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _08080670 @ =0x00004140
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	bl sub_8001570
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #4
	strh r0, [r1]
_08080652:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080664: .4byte 0x08A14414
_08080668: .4byte 0x02020188
_0808066C: .4byte 0x02023CA8
_08080670: .4byte 0x00004140

