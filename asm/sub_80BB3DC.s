	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BlitClippedTileMapToBg, 0x080B12E4 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_80BB3DC, "ax", %progbits
@ sub_80BB3DC @ JP 0x080BB3DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB3DC
	.thumb_func
sub_80BB3DC:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	adds r6, r0, #0
	mov sb, r1
	ldr r0, _080BB458 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r5, _080BB45C @ =0x08AC0B80
	ldr r0, [r5, #8]
	str r6, [sp]
	movs r1, #2
	add r1, sb
	mov r8, r1
	str r1, [sp, #4]
	movs r4, #0x1e
	str r4, [sp, #8]
	movs r1, #0x10
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #1
	movs r3, #2
	bl BlitClippedTileMapToBg
	ldr r0, [r5, #4]
	str r6, [sp]
	mov r1, r8
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0x12
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl BlitClippedTileMapToBg
	ldr r0, [r5]
	str r6, [sp]
	mov r1, sb
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #0x14
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl BlitClippedTileMapToBg
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB458: .4byte 0x020234A8
_080BB45C: .4byte 0x08AC0B80

