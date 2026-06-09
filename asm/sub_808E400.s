	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_808E400, "ax", %progbits
@ sub_808E400 @ JP 0x0808E400 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808E400
	.thumb_func
sub_808E400:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0808E440 @ =0x08A738E0
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808E44C
	ldr r0, _0808E444 @ =0x02022FE8
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _0808E448 @ =0x020237E8
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl j_TmFillRect
	b _0808E464
	.align 2, 0
_0808E440: .4byte 0x08A738E0
_0808E444: .4byte 0x02022FE8
_0808E448: .4byte 0x020237E8
_0808E44C:
	ldr r0, _0808E4B8 @ =0x02023016
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _0808E4BC @ =0x02023816
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl j_TmFillRect
_0808E464:
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, _0808E4C0 @ =0x08A7395E
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _0808E4C4 @ =0x08A738E0
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808E4D8
	movs r4, #0xa3
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0808E4C8 @ =0x02003D2C
	adds r0, r4, r0
	ldr r1, _0808E4CC @ =0x02022FE8
	adds r2, r5, #0
	movs r3, #7
	bl j_TmCopyRect
	ldr r0, _0808E4D0 @ =0x0200422C
	adds r4, r4, r0
	ldr r1, _0808E4D4 @ =0x020237E8
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl j_TmCopyRect
	b _0808E4FE
	.align 2, 0
_0808E4B8: .4byte 0x02023016
_0808E4BC: .4byte 0x02023816
_0808E4C0: .4byte 0x08A7395E
_0808E4C4: .4byte 0x08A738E0
_0808E4C8: .4byte 0x02003D2C
_0808E4CC: .4byte 0x02022FE8
_0808E4D0: .4byte 0x0200422C
_0808E4D4: .4byte 0x020237E8
_0808E4D8:
	ldr r0, _0808E524 @ =0x02003FAC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _0808E528 @ =0x02022CA8
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl j_TmCopyRect
	ldr r0, _0808E52C @ =0x020044AC
	ldr r1, _0808E530 @ =0x020234A8
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl j_TmCopyRect
_0808E4FE:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _0808E51C
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8002DE4
_0808E51C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E524: .4byte 0x02003FAC
_0808E528: .4byte 0x02022CA8
_0808E52C: .4byte 0x020044AC
_0808E530: .4byte 0x020234A8

