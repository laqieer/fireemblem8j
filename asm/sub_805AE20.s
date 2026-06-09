	.syntax unified
	.set AnimSort, 0x08004EB4 + 1
	.set GetAISLayerId, 0x0805AEF8 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_807947C, 0x0807947C + 1
	.section .text.sub_805AE20, "ax", %progbits
@ sub_805AE20 @ JP 0x0805AE20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805AE20
	.thumb_func
sub_805AE20:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _0805AE40
	ldr r0, _0805AE3C @ =0x080DFF00
	lsls r1, r6, #2
	adds r2, r1, r0
	ldrb r5, [r2]
	adds r1, #1
	adds r1, r1, r0
	b _0805AE4E
	.align 2, 0
_0805AE3C: .4byte 0x080DFF00
_0805AE40:
	ldr r2, _0805AE6C @ =0x080DFF00
	lsls r1, r6, #2
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	adds r1, #3
	adds r1, r1, r2
_0805AE4E:
	ldrb r7, [r1]
	cmp r5, #0xff
	beq _0805AE94
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805AE78
	ldr r0, _0805AE70 @ =0x0200005C
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805AE74 @ =0x0200F1C8
	b _0805AE84
	.align 2, 0
_0805AE6C: .4byte 0x080DFF00
_0805AE70: .4byte 0x0200005C
_0805AE74: .4byte 0x0200F1C8
_0805AE78:
	ldr r0, _0805AE8C @ =0x02000060
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805AE90 @ =0x02011BC8
_0805AE84:
	adds r1, r1, r0
	str r1, [r4, #0x24]
	str r1, [r4, #0x20]
	b _0805AE9E
	.align 2, 0
_0805AE8C: .4byte 0x02000060
_0805AE90: .4byte 0x02011BC8
_0805AE94:
	ldr r0, _0805AEEC @ =0x085E3F8C
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x10]
_0805AE9E:
	movs r3, #0
	movs r2, #0
	strh r7, [r4, #0xa]
	ldrh r1, [r4, #8]
	ldr r0, _0805AEF0 @ =0x0000F3FF
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r4, #8]
	strh r2, [r4, #6]
	ldrh r1, [r4, #0xc]
	movs r0, #0xe0
	lsls r0, r0, #3
	ands r0, r1
	strh r0, [r4, #0xc]
	strb r6, [r4, #0x12]
	strb r3, [r4, #0x14]
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	lsls r1, r1, #0xb
	ldr r0, _0805AEF4 @ =0x020041C8
	adds r1, r1, r0
	str r1, [r4, #0x30]
	bl AnimSort
	adds r0, r4, #0
	bl sub_807947C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AEEC: .4byte 0x085E3F8C
_0805AEF0: .4byte 0x0000F3FF
_0805AEF4: .4byte 0x020041C8

