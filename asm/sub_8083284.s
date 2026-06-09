	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8001570, 0x08001570 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_8083284, "ax", %progbits
@ sub_8083284 @ JP 0x08083284 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083284
	.thumb_func
sub_8083284:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _08083326
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _080832AC
	ldr r0, _080832A8 @ =0x000003BF
	ldr r1, [r4, #0x30]
	bl sub_8014B50
	b _080832D2
	.align 2, 0
_080832A8: .4byte 0x000003BF
_080832AC:
	cmp r1, #0xc
	bne _080832C6
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0xc]
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityBmMaps
	bl sub_8027144
	b _080832D2
_080832C6:
	cmp r1, #0x11
	bls _080832D2
	adds r0, r4, #0
	bl sub_8002DE4
	b _08083330
_080832D2:
	ldr r0, _08083338 @ =0x08A14CEC
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r6, _0808333C @ =0x02020188
	adds r1, r6, #0
	bl sub_8013008
	ldr r1, _08083340 @ =0x02023CA8
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _080832EE
	adds r0, #7
_080832EE:
	asrs r0, r0, #3
	subs r0, #4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r4, #0x34]
	cmp r3, #0
	bge _080832FE
	adds r3, #7
_080832FE:
	asrs r3, r3, #3
	subs r3, #6
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _08083344 @ =0x00004140
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
_08083326:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08083330:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08083338: .4byte 0x08A14CEC
_0808333C: .4byte 0x02020188
_08083340: .4byte 0x02023CA8
_08083344: .4byte 0x00004140

