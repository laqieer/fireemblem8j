	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_808E2D4, "ax", %progbits
@ sub_808E2D4 @ JP 0x0808E2D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808E2D4
	.thumb_func
sub_808E2D4:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0808E30C @ =0x08A738E0
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
	bge _0808E318
	ldr r0, _0808E310 @ =0x02022FE8
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _0808E314 @ =0x020237E8
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl j_TmFillRect
	b _0808E330
	.align 2, 0
_0808E30C: .4byte 0x08A738E0
_0808E310: .4byte 0x02022FE8
_0808E314: .4byte 0x020237E8
_0808E318:
	ldr r0, _0808E384 @ =0x02023016
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _0808E388 @ =0x02023816
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl j_TmFillRect
_0808E330:
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, _0808E38C @ =0x08A7395B
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r0, #1
	ldr r1, _0808E390 @ =0x08A738E0
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
	bge _0808E3A8
	ldr r4, _0808E394 @ =0x00000147
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0808E398 @ =0x02003D2C
	adds r0, r4, r0
	ldr r1, _0808E39C @ =0x02022FE8
	adds r2, r5, #0
	movs r3, #7
	bl j_TmCopyRect
	ldr r0, _0808E3A0 @ =0x0200422C
	adds r4, r4, r0
	ldr r1, _0808E3A4 @ =0x020237E8
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl j_TmCopyRect
	b _0808E3CE
	.align 2, 0
_0808E384: .4byte 0x02023016
_0808E388: .4byte 0x02023816
_0808E38C: .4byte 0x08A7395B
_0808E390: .4byte 0x08A738E0
_0808E394: .4byte 0x00000147
_0808E398: .4byte 0x02003D2C
_0808E39C: .4byte 0x02022FE8
_0808E3A0: .4byte 0x0200422C
_0808E3A4: .4byte 0x020237E8
_0808E3A8:
	ldr r0, _0808E3F0 @ =0x02003FAC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _0808E3F4 @ =0x02022CA8
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl j_TmCopyRect
	ldr r0, _0808E3F8 @ =0x020044AC
	ldr r1, _0808E3FC @ =0x020234A8
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl j_TmCopyRect
_0808E3CE:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _0808E3E8
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8002DE4
_0808E3E8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E3F0: .4byte 0x02003FAC
_0808E3F4: .4byte 0x02022CA8
_0808E3F8: .4byte 0x020044AC
_0808E3FC: .4byte 0x020234A8

