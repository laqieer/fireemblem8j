	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnit, 0x08019108 + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808E75C, 0x0808E75C + 1
	.section .text.sub_808DFF8, "ax", %progbits
@ sub_808DFF8 @ JP 0x0808DFF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808DFF8
	.thumb_func
sub_808DFF8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r1, _0808E044 @ =0x08A738E0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r4, #0
	cmp r0, #0
	blt _0808E01A
	movs r4, #0xe
_0808E01A:
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0808E050
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _0808E048 @ =0x02022CA8
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _0808E04C @ =0x020234A8
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	b _0808E070
	.align 2, 0
_0808E044: .4byte 0x08A738E0
_0808E048: .4byte 0x02022CA8
_0808E04C: .4byte 0x020234A8
_0808E050:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _0808E0C8 @ =0x02022CCA
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _0808E0CC @ =0x020234CA
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
_0808E070:
	mov r8, r5
	adds r6, r4, #0
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, _0808E0D0 @ =0x08A73954
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _0808E0D4 @ =0x08A738E0
	adds r0, r7, #0
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
	bge _0808E0E8
	movs r4, #0xd
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0808E0D8 @ =0x02003D2C
	adds r0, r4, r0
	ldr r1, _0808E0DC @ =0x02022CA8
	adds r1, r6, r1
	adds r2, r5, #0
	movs r3, #6
	bl j_TmCopyRect
	ldr r0, _0808E0E0 @ =0x0200422C
	adds r4, r4, r0
	ldr r1, _0808E0E4 @ =0x020234A8
	adds r1, r6, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl j_TmCopyRect
	b _0808E10E
	.align 2, 0
_0808E0C8: .4byte 0x02022CCA
_0808E0CC: .4byte 0x020234CA
_0808E0D0: .4byte 0x08A73954
_0808E0D4: .4byte 0x08A738E0
_0808E0D8: .4byte 0x02003D2C
_0808E0DC: .4byte 0x02022CA8
_0808E0E0: .4byte 0x0200422C
_0808E0E4: .4byte 0x020234A8
_0808E0E8:
	ldr r0, _0808E158 @ =0x02003D2C
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _0808E15C @ =0x02022CA8
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl j_TmCopyRect
	ldr r0, _0808E160 @ =0x0200422C
	ldr r1, _0808E164 @ =0x020234A8
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl j_TmCopyRect
_0808E10E:
	ldr r0, [r7, #0x58]
	adds r0, #1
	str r0, [r7, #0x58]
	cmp r0, #4
	bne _0808E14C
	adds r1, r7, #0
	adds r1, #0x55
	movs r0, #0
	strb r0, [r1]
	str r0, [r7, #0x58]
	adds r0, r7, #0
	bl sub_8002DE4
	ldr r2, _0808E168 @ =0x0202BCAC
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808E16C @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r7, #0
	bl sub_808E75C
_0808E14C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E158: .4byte 0x02003D2C
_0808E15C: .4byte 0x02022CA8
_0808E160: .4byte 0x0200422C
_0808E164: .4byte 0x020234A8
_0808E168: .4byte 0x0202BCAC
_0808E16C: .4byte 0x0202E4D4

