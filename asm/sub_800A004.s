	.syntax unified
	.set CopyString, 0x08012F78 + 1
	.set GetCharacterData, 0x0801913C + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_801729C, 0x0801729C + 1
	.set sub_8031430, 0x08031430 + 1
	.section .text.sub_800A004, "ax", %progbits
@ StringInsertSpecialPrefixByCtrl @ JP 0x0800A004 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StringInsertSpecialPrefixByCtrl
	.thumb_func
StringInsertSpecialPrefixByCtrl:
	push {r4, r5, lr}
	ldr r5, _0800A01C @ =0x0202AAA8
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r5, r0
	ldr r0, _0800A020 @ =0xFFFFFC00
	adds r1, r5, r0
	adds r0, r5, #0
	bl CopyString
	b _0800A0FC
	.align 2, 0
_0800A01C: .4byte 0x0202AAA8
_0800A020: .4byte 0xFFFFFC00
_0800A024:
	adds r0, r1, #0
	cmp r0, #0x1f
	bhi _0800A02E
	strb r1, [r4]
	b _0800A0CA
_0800A02E:
	cmp r0, #0x80
	beq _0800A038
	strb r1, [r4]
	adds r5, #1
	b _0800A0C4
_0800A038:
	adds r5, #1
	ldrb r0, [r5]
	subs r0, #0x12
	cmp r0, #0x10
	bhi _0800A0C0
	lsls r0, r0, #2
	ldr r1, _0800A04C @ =_0800A050
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A04C: .4byte _0800A050
_0800A050: @ jump table
	.4byte _0800A094 @ case 0
	.4byte _0800A098 @ case 1
	.4byte _0800A09C @ case 2
	.4byte _0800A0A0 @ case 3
	.4byte _0800A0C0 @ case 4
	.4byte _0800A0C0 @ case 5
	.4byte _0800A0C0 @ case 6
	.4byte _0800A0C0 @ case 7
	.4byte _0800A0C0 @ case 8
	.4byte _0800A0C0 @ case 9
	.4byte _0800A0C0 @ case 10
	.4byte _0800A0C0 @ case 11
	.4byte _0800A0C0 @ case 12
	.4byte _0800A0C0 @ case 13
	.4byte _0800A0A4 @ case 14
	.4byte _0800A0C0 @ case 15
	.4byte _0800A0AA @ case 16
_0800A094:
	movs r1, #0
	b _0800A0D0
_0800A098:
	movs r1, #1
	b _0800A0D0
_0800A09C:
	movs r1, #2
	b _0800A0D0
_0800A0A0:
	movs r1, #3
	b _0800A0D0
_0800A0A4:
	bl sub_8031430
	b _0800A0B2
_0800A0AA:
	ldr r0, _0800A0BC @ =0x0203A954
	ldrh r0, [r0, #6]
	bl sub_801729C
_0800A0B2:
	adds r1, r0, #0
	adds r0, r4, #0
	bl CopyString
	b _0800A0EA
	.align 2, 0
_0800A0BC: .4byte 0x0203A954
_0800A0C0:
	movs r0, #0x80
	strb r0, [r4]
_0800A0C4:
	adds r4, #1
	ldrb r0, [r5]
	strb r0, [r4]
_0800A0CA:
	adds r5, #1
	adds r4, #1
	b _0800A0FC
_0800A0D0:
	ldr r0, _0800A110 @ =0x0202BCEC
	adds r0, #0x1c
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetCharacterData
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl CopyString
_0800A0EA:
	ldrb r0, [r4]
	adds r1, r5, #1
	cmp r0, #0
	beq _0800A0FA
_0800A0F2:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800A0F2
_0800A0FA:
	adds r5, r1, #0
_0800A0FC:
	ldrb r1, [r5]
	cmp r1, #0
	bne _0800A024
	movs r0, #0
	strb r0, [r4]
	ldr r0, _0800A114 @ =0x0202AEA8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800A110: .4byte 0x0202BCEC
_0800A114: .4byte 0x0202AEA8

