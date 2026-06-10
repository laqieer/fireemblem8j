	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutSpriteExt, 0x08005330 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_800ACA8, 0x0800ACA8 + 1
	.set sub_80386AC, 0x080386AC + 1
	.set sub_80389CC, 0x080389CC + 1
	.section .text.sub_803914C, "ax", %progbits
@ sub_803914C @ JP 0x0803914C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803914C
	.thumb_func
sub_803914C:
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r1, r0, #1
	str r1, [r5, #0x34]
	cmp r1, #0x2c
	bgt _080391A8
	ldr r0, _08039198 @ =0x02003BE8
	lsls r1, r1, #0xc
	add r2, sp, #8
	bl sub_800ACA8
	ldr r1, [sp, #8]
	asrs r1, r1, #4
	ldr r0, _0803919C @ =0x080DCD04
	ldr r3, [r5, #0x2c]
	lsls r3, r3, #3
	adds r3, r3, r0
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r2, [sp, #0xc]
	asrs r2, r2, #4
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r0, _080391A0 @ =0x000001FF
	ands r2, r0
	ldr r3, _080391A4 @ =0x085C6CC4
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	b _08039232
	.align 2, 0
_08039198: .4byte 0x02003BE8
_0803919C: .4byte 0x080DCD04
_080391A0: .4byte 0x000001FF
_080391A4: .4byte 0x085C6CC4
_080391A8:
	ldr r4, [r5, #0x2c]
	cmp r4, #4
	bne _080391DC
	ldr r0, _080391D4 @ =0x02003B08
	ldr r1, [r5, #0x30]
	ldr r3, _080391D8 @ =0x080DCD04
	adds r2, r3, #0
	adds r2, #0x44
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, #0x45
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r4, [sp]
	movs r4, #1
	str r4, [sp, #4]
	bl sub_80389CC
	b _08039214
	.align 2, 0
_080391D4: .4byte 0x02003B08
_080391D8: .4byte 0x080DCD04
_080391DC:
	lsls r0, r4, #6
	ldr r2, _0803923C @ =0x080DCD04
	lsls r1, r4, #3
	adds r4, r1, r2
	adds r1, r4, #0
	adds r1, #0x28
	ldrb r2, [r1]
	movs r1, #8
	subs r1, r1, r2
	lsls r1, r1, #3
	ldr r3, _08039240 @ =0x02003A08
	adds r1, r1, r3
	adds r0, r0, r1
	ldrh r1, [r5, #0x30]
	adds r3, r4, #0
	adds r3, #0x24
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r4, #0x25
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl sub_80386AC
_08039214:
	ldr r0, _08039244 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08039226
	movs r0, #0x76
	bl m4aSongNumStart
_08039226:
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	bl sub_8002DE4
_08039232:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803923C: .4byte 0x080DCD04
_08039240: .4byte 0x02003A08
_08039244: .4byte 0x0202BCEC

