	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutSpriteExt, 0x08005330 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_800ACA8, 0x0800ACA8 + 1
	.set sub_80386AC, 0x080386AC + 1
	.section .text.sub_8039520, "ax", %progbits
@ sub_8039520 @ JP 0x08039520 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8039520
	.thumb_func
sub_8039520:
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	adds r1, r0, #1
	str r1, [r4, #0x38]
	cmp r1, #0x1d
	bgt _08039560
	ldr r0, _08039558 @ =0x02003BE8
	lsls r1, r1, #0xc
	add r4, sp, #0x14
	adds r2, r4, #0
	bl sub_800ACA8
	ldr r1, [sp, #0x14]
	asrs r1, r1, #4
	ldr r2, [r4, #4]
	lsls r2, r2, #0x13
	lsrs r2, r2, #0x17
	ldr r3, _0803955C @ =0x085C6CC4
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	b _080395B6
	.align 2, 0
_08039558: .4byte 0x02003BE8
_0803955C: .4byte 0x085C6CC4
_08039560:
	ldr r2, _080395C0 @ =0x03001798
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	add r1, sp, #8
	adds r0, #0xc
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	add r0, sp, #8
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x16
	lsrs r1, r0, #0x19
	cmp r1, #0x63
	bgt _08039586
	adds r1, #1
_08039586:
	ldr r0, _080395C4 @ =0x02003B70
	movs r2, #7
	str r2, [sp]
	movs r2, #2
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x1a
	bl sub_80386AC
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, _080395C8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080395B0
	movs r0, #0x76
	bl m4aSongNumStart
_080395B0:
	adds r0, r4, #0
	bl sub_8002DE4
_080395B6:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080395C0: .4byte 0x03001798
_080395C4: .4byte 0x02003B70
_080395C8: .4byte 0x0202BCEC

