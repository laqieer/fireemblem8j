	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set InitScanline, 0x080841B8 + 1
	.set Memset16, 0x08014958 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8009608, 0x08009608 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8013B5C, 0x08013B5C + 1
	.set sub_8080CB8, 0x08080CB8 + 1
	.set sub_80841EC, 0x080841EC + 1
	.section .text.sub_807FF28, "ax", %progbits
@ sub_807FF28 @ JP 0x0807FF28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807FF28
	.thumb_func
sub_807FF28:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0807FFC0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807FF40
	movs r0, #0xb3
	bl m4aSongNumStart
_0807FF40:
	ldr r0, _0807FFC4 @ =0x08A20A5C
	ldr r1, _0807FFC8 @ =0x06013800
	bl sub_8013008
	ldr r0, _0807FFCC @ =0x08A20D14
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	movs r0, #4
	bl sub_8013B5C
	movs r0, #2
	bl GetBackgroundTileDataOffset
	ldr r1, _0807FFD0 @ =0x06002800
	adds r0, r0, r1
	ldr r2, _0807FFD4 @ =0x0000FFFF
	movs r1, #0x10
	bl Memset16
	ldr r0, _0807FFD8 @ =0x02023CA8
	movs r1, #0x80
	lsls r1, r1, #3
	ldr r2, _0807FFDC @ =0x00004140
	bl Memset16
	movs r0, #4
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	adds r0, #0x40
	movs r4, #0
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldr r0, _0807FFE0 @ =0x08A16880
	ldr r1, [r5, #0x30]
	adds r1, #4
	ldr r2, [r5, #0x34]
	ldr r3, _0807FFE4 @ =0x000041C0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl sub_8009608
	bl InitScanline
	bl sub_80841EC
	bl sub_8080CB8
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FFC0: .4byte 0x0202BCEC
_0807FFC4: .4byte 0x08A20A5C
_0807FFC8: .4byte 0x06013800
_0807FFCC: .4byte 0x08A20D14
_0807FFD0: .4byte 0x06002800
_0807FFD4: .4byte 0x0000FFFF
_0807FFD8: .4byte 0x02023CA8
_0807FFDC: .4byte 0x00004140
_0807FFE0: .4byte 0x08A16880
_0807FFE4: .4byte 0x000041C0

