	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set InitScanline, 0x080841B8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_807DE2C, 0x0807DE2C + 1
	.set sub_807E160, 0x0807E160 + 1
	.set sub_8084418, 0x08084418 + 1
	.section .text.sub_807DF48, "ax", %progbits
@ sub_807DF48 @ JP 0x0807DF48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807DF48
	.thumb_func
sub_807DF48:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807DF8C @ =0x08A1DB88
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807DF90 @ =0x06000020
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _0807DF94 @ =0x08A1DE14
	bl sub_807DE2C
	ldr r0, _0807DF98 @ =0x0203E1EC
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #1
	beq _0807DF9C
	cmp r0, #2
	beq _0807DFAA
	b _0807DFC2
	.align 2, 0
_0807DF8C: .4byte 0x08A1DB88
_0807DF90: .4byte 0x06000020
_0807DF94: .4byte 0x08A1DE14
_0807DF98: .4byte 0x0203E1EC
_0807DF9C:
	movs r2, #5
	rsbs r2, r2, #0
	adds r0, r5, #0
	movs r1, #0
	bl sub_807E160
	b _0807DFC2
_0807DFAA:
	movs r2, #1
	rsbs r2, r2, #0
	adds r0, r5, #0
	movs r1, #0
	bl sub_807E160
	movs r2, #0xb
	rsbs r2, r2, #0
	adds r0, r5, #0
	movs r1, #1
	bl sub_807E160
_0807DFC2:
	bl InitScanline
	ldr r0, _0807DFE8 @ =0x0203E1EC
	ldrb r1, [r0, #0x11]
	lsls r0, r1, #3
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #0xe
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	ldr r3, _0807DFEC @ =0x020228A8
	ldrh r2, [r3, #0x22]
	adds r3, #0x42
	ldrh r3, [r3]
	bl sub_8084418
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DFE8: .4byte 0x0203E1EC
_0807DFEC: .4byte 0x020228A8

