	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set PutTmLinear, 0x08014A18 + 1
	.set UnitHasMagicRank, 0x0801876C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80143EC, 0x080143EC + 1
	.set sub_8014450, 0x08014450 + 1
	.section .text.sub_8080DD8, "ax", %progbits
@ sub_8080DD8 @ JP 0x08080DD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8080DD8
	.thumb_func
sub_8080DD8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov sl, r1
	mov sb, r2
	ldr r5, _08080EC0 @ =0x020234A8
	adds r0, r5, #0
	movs r1, #0
	bl sub_80011D0
	ldr r4, _08080EC4 @ =0x08857B08
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08080EC8 @ =0x06004000
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _08080ECC @ =0x08857F40
	ldr r4, _08080ED0 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	movs r2, #0xe0
	lsls r2, r2, #2
	movs r3, #0xa4
	lsls r3, r3, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutTmLinear
	ldr r0, _08080ED4 @ =0x08858068
	movs r1, #0xa0
	movs r2, #0x20
	bl sub_8000D68
	mov r0, sb
	lsls r4, r0, #5
	adds r4, #2
	add r4, sl
	lsls r4, r4, #1
	ldr r0, _08080ED8 @ =0x02022CA8
	adds r4, r4, r0
	ldr r1, _08080EDC @ =0x0203E1EC
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r7, r0, r1
	ldr r0, [r7]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_8014450
	ldr r1, _08080EE0 @ =0x08A1455C
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08080EAC
	mov r8, r1
	mov r5, r8
	movs r6, #0
_08080E64:
	ldrb r1, [r5, #1]
	add r1, sb
	lsls r1, r1, #5
	ldrb r0, [r5]
	add r0, sl
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08080ED8 @ =0x02022CA8
	adds r4, r1, r0
	ldr r0, [r7]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	cmp r0, #1
	bne _08080E88
	adds r1, r6, #4
_08080E88:
	mov r0, r8
	adds r0, #4
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #3
	movs r2, #3
	bl sub_80143EC
	adds r5, #0xc
	adds r6, #0xc
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _08080E64
_08080EAC:
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080EC0: .4byte 0x020234A8
_08080EC4: .4byte 0x08857B08
_08080EC8: .4byte 0x06004000
_08080ECC: .4byte 0x08857F40
_08080ED0: .4byte 0x02020188
_08080ED4: .4byte 0x08858068
_08080ED8: .4byte 0x02022CA8
_08080EDC: .4byte 0x0203E1EC
_08080EE0: .4byte 0x08A1455C

