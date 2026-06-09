	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set ResetGmStoryNode, 0x080C1DC0 + 1
	.set WMLoc_GetChapterId, 0x080C03E0 + 1
	.set sub_800226C, 0x0800226C + 1
	.set sub_800D340, 0x0800D340 + 1
	.set sub_80BD548, 0x080BD548 + 1
	.set sub_80BEE9C, 0x080BEE9C + 1
	.set sub_80C0414, 0x080C0414 + 1
	.set sub_80C4FC0, 0x080C4FC0 + 1
	.section .text.sub_80BF1C8, "ax", %progbits
@ sub_80BF1C8 @ JP 0x080BF1C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BF1C8
	.thumb_func
sub_80BF1C8:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #4
	bl sub_800226C
	ldr r2, _080BF1F4 @ =0x03005270
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080BF1EA
	ldr r6, _080BF1F8 @ =0x0202BCEC
	ldrb r1, [r6, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080BF1FC
_080BF1EA:
	ldr r0, [r5, #0x2c]
	bl sub_80BEE9C
	b _080BF250
	.align 2, 0
_080BF1F4: .4byte 0x03005270
_080BF1F8: .4byte 0x0202BCEC
_080BF1FC:
	ldrb r0, [r2, #0x11]
	adds r1, r2, #0
	adds r1, #0xc8
	strb r0, [r1]
	bl sub_80C0414
	cmp r0, #0
	blt _080BF250
	bl WMLoc_GetChapterId
	adds r4, r0, #0
	strb r4, [r6, #0xe]
	ldr r6, _080BF264 @ =0x08907F74
	bl GetROMChapterStruct
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _080BF25C
	bl ResetGmStoryNode
	ldr r1, [r5, #0x48]
	adds r1, #0x32
	ldrb r2, [r1]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl GetROMChapterStruct
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	movs r1, #0
	bl sub_800D340
_080BF250:
	adds r0, r5, #0
	bl sub_80BD548
	movs r0, #0
	bl sub_80C4FC0
_080BF25C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BF264: .4byte 0x08907F74

