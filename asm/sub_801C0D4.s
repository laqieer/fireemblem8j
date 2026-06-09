	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set UpdateMapViewWithFog, 0x0801DF3C + 1
	.set sub_801C064, 0x0801C064 + 1
	.set sub_801DA74, 0x0801DA74 + 1
	.section .text.sub_801C0D4, "ax", %progbits
@ sub_801C0D4 @ JP 0x0801C0D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C0D4
	.thumb_func
sub_801C0D4:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_801DA74
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C122
	ldr r0, _0801C10C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x31
	ands r0, r1
	cmp r0, #0
	beq _0801C122
	ldr r1, _0801C110 @ =0x0202BCEC
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	bne _0801C114
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0xc]
	bl UpdateMapViewWithFog
	b _0801C11A
	.align 2, 0
_0801C10C: .4byte 0x085775CC
_0801C110: .4byte 0x0202BCEC
_0801C114:
	movs r0, #0
	bl UpdateMapViewWithFog
_0801C11A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_801C064
_0801C122:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

