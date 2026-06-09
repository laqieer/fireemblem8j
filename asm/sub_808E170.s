	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_808E170, "ax", %progbits
@ sub_808E170 @ JP 0x0808E170 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808E170
	.thumb_func
sub_808E170:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r3, _0808E1D0 @ =0x08A738E0
	adds r2, r6, #0
	adds r2, #0x50
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #0
	cmp r0, #0
	blt _0808E194
	movs r4, #0xe
_0808E194:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808E1DC
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _0808E1D4 @ =0x02022CA8
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _0808E1D8 @ =0x020234A8
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	b _0808E1FC
	.align 2, 0
_0808E1D0: .4byte 0x08A738E0
_0808E1D4: .4byte 0x02022CA8
_0808E1D8: .4byte 0x020234A8
_0808E1DC:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _0808E254 @ =0x02022CCA
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _0808E258 @ =0x020234CA
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
_0808E1FC:
	mov r8, r5
	adds r7, r4, #0
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, _0808E25C @ =0x08A73958
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _0808E260 @ =0x08A738E0
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808E274
	movs r4, #0xd
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0808E264 @ =0x02003D2C
	adds r0, r4, r0
	ldr r1, _0808E268 @ =0x02022CA8
	adds r1, r7, r1
	adds r2, r5, #0
	movs r3, #6
	bl j_TmCopyRect
	ldr r0, _0808E26C @ =0x0200422C
	adds r4, r4, r0
	ldr r1, _0808E270 @ =0x020234A8
	adds r1, r7, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl j_TmCopyRect
	b _0808E29A
	.align 2, 0
_0808E254: .4byte 0x02022CCA
_0808E258: .4byte 0x020234CA
_0808E25C: .4byte 0x08A73958
_0808E260: .4byte 0x08A738E0
_0808E264: .4byte 0x02003D2C
_0808E268: .4byte 0x02022CA8
_0808E26C: .4byte 0x0200422C
_0808E270: .4byte 0x020234A8
_0808E274:
	ldr r0, _0808E2C4 @ =0x02003D2C
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _0808E2C8 @ =0x02022CA8
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl j_TmCopyRect
	ldr r0, _0808E2CC @ =0x0200422C
	ldr r1, _0808E2D0 @ =0x020234A8
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl j_TmCopyRect
_0808E29A:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _0808E2BA
	adds r1, r6, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
	str r0, [r6, #0x58]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8002DE4
_0808E2BA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E2C4: .4byte 0x02003D2C
_0808E2C8: .4byte 0x02022CA8
_0808E2CC: .4byte 0x0200422C
_0808E2D0: .4byte 0x020234A8

