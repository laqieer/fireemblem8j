	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_801EF24, "ax", %progbits
@ sub_801EF24 @ JP 0x0801EF24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801EF24
	.thumb_func
sub_801EF24:
	push {r4, lr}
	ldr r0, _0801EF68 @ =0x085C7540
	ldr r1, _0801EF6C @ =0x06014000
	bl sub_8013008
	ldr r0, _0801EF70 @ =0x085C8BF8
	ldr r1, _0801EF74 @ =0x06002000
	bl sub_8013008
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _0801EF78 @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _0801EFCC
	cmp r0, #0x40
	bgt _0801EF7C
	cmp r0, #0
	beq _0801EF82
	b _0801EFEC
	.align 2, 0
_0801EF68: .4byte 0x085C7540
_0801EF6C: .4byte 0x06014000
_0801EF70: .4byte 0x085C8BF8
_0801EF74: .4byte 0x06002000
_0801EF78: .4byte 0x0202BCEC
_0801EF7C:
	cmp r0, #0x80
	beq _0801EF9C
	b _0801EFEC
_0801EF82:
	ldr r0, _0801EF90 @ =0x085C7918
	ldr r1, _0801EF94 @ =0x06002800
	bl sub_8013008
	ldr r4, _0801EF98 @ =0x085C7F4C
	b _0801EFA6
	.align 2, 0
_0801EF90: .4byte 0x085C7918
_0801EF94: .4byte 0x06002800
_0801EF98: .4byte 0x085C7F4C
_0801EF9C:
	ldr r0, _0801EFC0 @ =0x085C7F6C
	ldr r1, _0801EFC4 @ =0x06002800
	bl sub_8013008
	ldr r4, _0801EFC8 @ =0x085C8588
_0801EFA6:
	adds r0, r4, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl sub_8000D68
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	b _0801EFEC
	.align 2, 0
_0801EFC0: .4byte 0x085C7F6C
_0801EFC4: .4byte 0x06002800
_0801EFC8: .4byte 0x085C8588
_0801EFCC:
	ldr r0, _0801EFF4 @ =0x085C85A8
	ldr r1, _0801EFF8 @ =0x06002800
	bl sub_8013008
	ldr r4, _0801EFFC @ =0x085C8BB8
	adds r0, r4, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl sub_8000D68
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_8000D68
_0801EFEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801EFF4: .4byte 0x085C85A8
_0801EFF8: .4byte 0x06002800
_0801EFFC: .4byte 0x085C8BB8

