	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80146B4, 0x080146B4 + 1
	.section .text.sub_807FAA4, "ax", %progbits
@ AntitoxinPureWaterfx_Loop @ JP 0x0807FAA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AntitoxinPureWaterfx_Loop
	.thumb_func
AntitoxinPureWaterfx_Loop:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r7, _0807FB0C @ =0x02023CA8
	ldr r0, [r6, #0x30]
	cmp r0, #0
	bge _0807FAB4
	adds r0, #7
_0807FAB4:
	asrs r0, r0, #3
	subs r1, r0, #3
	ldr r2, [r6, #0x34]
	cmp r2, #0
	bge _0807FAC0
	adds r2, #7
_0807FAC0:
	asrs r2, r2, #3
	subs r2, #3
	ldr r3, _0807FB10 @ =0x00004140
	movs r0, #6
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0807FB14 @ =0x08A1F998
	str r0, [sp, #8]
	ldr r5, _0807FB18 @ =0x08A141F4
	adds r4, r6, #0
	adds r4, #0x40
	ldrh r0, [r4]
	lsrs r0, r0, #1
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	adds r0, r7, #0
	bl sub_80146B4
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	lsrs r0, r0, #1
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807FB04
	adds r0, r6, #0
	bl sub_8002DE4
_0807FB04:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FB0C: .4byte 0x02023CA8
_0807FB10: .4byte 0x00004140
_0807FB14: .4byte 0x08A1F998
_0807FB18: .4byte 0x08A141F4

