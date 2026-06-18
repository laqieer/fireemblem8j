	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8001570, 0x08001570 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.set sub_807F274, 0x0807F274 + 1
	.section .text.sub_807F1BC, "ax", %progbits
@ MapAnim_GorgonHatch_Loop @ JP 0x0807F1BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MapAnim_GorgonHatch_Loop
	.thumb_func
MapAnim_GorgonHatch_Loop:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807F250
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _0807F1E4
	ldr r0, _0807F1E0 @ =0x000003CA
	ldr r1, [r4, #0x30]
	bl sub_8014B50
	b _0807F1FC
	.align 2, 0
_0807F1E0: .4byte 0x000003CA
_0807F1E4:
	cmp r1, #1
	bne _0807F1F0
	adds r0, r4, #0
	bl sub_807F274
	b _0807F1FC
_0807F1F0:
	cmp r1, #6
	bls _0807F1FC
	adds r0, r4, #0
	bl sub_8002DE4
	b _0807F25A
_0807F1FC:
	ldr r0, _0807F264 @ =0x08A1404C
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r6, _0807F268 @ =0x02020188
	adds r1, r6, #0
	bl sub_8013008
	ldr r1, _0807F26C @ =0x02023CA8
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _0807F218
	adds r0, #7
_0807F218:
	asrs r0, r0, #3
	subs r0, #8
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r4, #0x34]
	cmp r3, #0
	bge _0807F228
	adds r3, #7
_0807F228:
	asrs r3, r3, #3
	subs r3, #7
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _0807F270 @ =0x00004140
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
	movs r0, #5
	strh r0, [r1]
_0807F250:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0807F25A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F264: .4byte 0x08A1404C
_0807F268: .4byte 0x02020188
_0807F26C: .4byte 0x02023CA8
_0807F270: .4byte 0x00004140

