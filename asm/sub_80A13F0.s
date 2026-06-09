	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set StartItemHelpBox, 0x0808B0EC + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_809A4BC, 0x0809A4BC + 1
	.set sub_809DAF4, 0x0809DAF4 + 1
	.set sub_809F59C, 0x0809F59C + 1
	.set sub_80A1610, 0x080A1610 + 1
	.set sub_80B18C0, 0x080B18C0 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A13F0, "ax", %progbits
@ sub_80A13F0 @ JP 0x080A13F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A13F0
	.thumb_func
sub_80A13F0:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl sub_80034C4
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r1, [r5]
	movs r2, #3
	bl sub_809A4BC
	adds r0, r4, #0
	bl sub_80A1610
	ldr r0, _080A1490 @ =0x02013690
	ldr r1, _080A1494 @ =0x02023CC6
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r6, r4, #0
	adds r6, #0x4a
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_809F59C
	ldr r0, _080A1498 @ =0x02022EEC
	ldr r1, [r4, #0x2c]
	bl sub_809DAF4
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r7, r4, #0
	adds r7, #0x38
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80B1FBC
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r0, _080A149C @ =sub_80A0ED8
	movs r1, #2
	adds r2, r4, #0
	bl sub_80B18C0
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _080A14B0
	ldr r0, _080A14A0 @ =0x02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq _080A14A8
	ldr r2, _080A14A4 @ =0x020122D4
	ldrb r3, [r5]
	lsls r3, r3, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _080A14AE
	.align 2, 0
_080A1490: .4byte 0x02013690
_080A1494: .4byte 0x02023CC6
_080A1498: .4byte 0x02022EEC
_080A149C: .4byte 0x080A0ED9  @ sub_80A0ED8
_080A14A0: .4byte 0x02012F56
_080A14A4: .4byte 0x020122D4
_080A14A8:
	bl sub_808B2A4
	movs r0, #0xff
_080A14AE:
	strh r0, [r4, #0x36]
_080A14B0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

