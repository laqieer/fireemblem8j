	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8001570, 0x08001570 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_808310C, "ax", %progbits
@ sub_808310C @ JP 0x0808310C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808310C
	.thumb_func
sub_808310C:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _080831A2
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _08083134
	ldr r0, _08083130 @ =0x000003BF
	ldr r1, [r4, #0x30]
	bl sub_8014B50
	b _0808314E
	.align 2, 0
_08083130: .4byte 0x000003BF
_08083134:
	cmp r1, #0xc
	bne _08083142
	bl RefreshEntityBmMaps
	bl sub_8027144
	b _0808314E
_08083142:
	cmp r1, #0x11
	bls _0808314E
	adds r0, r4, #0
	bl sub_8002DE4
	b _080831AC
_0808314E:
	ldr r0, _080831B4 @ =0x08A14CEC
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r6, _080831B8 @ =0x02020188
	adds r1, r6, #0
	bl sub_8013008
	ldr r1, _080831BC @ =0x02023CA8
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _0808316A
	adds r0, #7
_0808316A:
	asrs r0, r0, #3
	subs r0, #4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r4, #0x34]
	cmp r3, #0
	bge _0808317A
	adds r3, #7
_0808317A:
	asrs r3, r3, #3
	subs r3, #6
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _080831C0 @ =0x00004140
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
_080831A2:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_080831AC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080831B4: .4byte 0x08A14CEC
_080831B8: .4byte 0x02020188
_080831BC: .4byte 0x02023CA8
_080831C0: .4byte 0x00004140

