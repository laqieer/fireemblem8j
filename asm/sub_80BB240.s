	.syntax unified
	.set AppendCharacter, 0x080B3558 + 1
	.set CheckPermanentFlag, 0x08086094 + 1
	.set GetPidDefeatType, 0x080BB21C + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80A9740, 0x080A9740 + 1
	.set sub_80B3538, 0x080B3538 + 1
	.set sub_80B3564, 0x080B3564 + 1
	.set sub_80C086C, 0x080C086C + 1
	.section .text.sub_80BB240, "ax", %progbits
@ sub_80BB240 @ JP 0x080BB240 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB240
	.thumb_func
sub_80BB240:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _080BB280 @ =0x08AC059C
	ldr r4, [r0]
	adds r0, r6, #0
	bl GetPidDefeatType
	adds r7, r0, #0
	cmp r7, #4
	bne _080BB25E
	movs r0, #0x7d
	bl CheckPermanentFlag
	movs r6, #0x80
	lsls r6, r6, #1
_080BB25E:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl sub_80A9740
	ldrb r1, [r0, #5]
	lsls r1, r1, #0x1a
	lsrs r5, r1, #0x1a
	movs r1, #0
	strb r1, [r4]
	ldrb r0, [r0, #0xe]
	lsrs r0, r0, #7
	cmp r0, #0
	beq _080BB284
	adds r0, r5, #0
	bl sub_80C086C
	b _080BB29E
	.align 2, 0
_080BB280: .4byte 0x08AC059C
_080BB284:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl sub_80B3564
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetROMChapterStruct
	adds r0, #0x70
	ldrh r0, [r0]
	bl sub_8009FA8
_080BB29E:
	adds r1, r4, #0
	bl sub_80B3538
	adds r4, r0, #0
	movs r0, #1
	adds r1, r4, #0
	bl AppendCharacter
	adds r4, r0, #0
	cmp r7, #5
	bhi _080BB318
	lsls r0, r7, #2
	ldr r1, _080BB2C0 @ =_080BB2C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BB2C0: .4byte _080BB2C4
_080BB2C4: @ jump table
	.4byte _080BB2DC @ case 0
	.4byte _080BB2E4 @ case 1
	.4byte _080BB2EC @ case 2
	.4byte _080BB2F4 @ case 3
	.4byte _080BB2FC @ case 4
	.4byte _080BB314 @ case 5
_080BB2DC:
	ldr r0, _080BB2E0 @ =0x00000749
	b _080BB302
	.align 2, 0
_080BB2E0: .4byte 0x00000749
_080BB2E4:
	ldr r0, _080BB2E8 @ =0x0000074A
	b _080BB302
	.align 2, 0
_080BB2E8: .4byte 0x0000074A
_080BB2EC:
	ldr r0, _080BB2F0 @ =0x0000074B
	b _080BB302
	.align 2, 0
_080BB2F0: .4byte 0x0000074B
_080BB2F4:
	ldr r0, _080BB2F8 @ =0x00000749
	b _080BB302
	.align 2, 0
_080BB2F8: .4byte 0x00000749
_080BB2FC:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r0, _080BB310 @ =0x000007B1
_080BB302:
	bl sub_8009FA8
	adds r1, r4, #0
	bl sub_80B3538
	b _080BB318
	.align 2, 0
_080BB310: .4byte 0x000007B1
_080BB314:
	movs r0, #0
	b _080BB31C
_080BB318:
	ldr r0, _080BB324 @ =0x08AC059C
	ldr r0, [r0]
_080BB31C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BB324: .4byte 0x08AC059C

