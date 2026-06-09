	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B3240, "ax", %progbits
@ sub_80B3240 @ JP 0x080B3240 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3240
	.thumb_func
sub_80B3240:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	mov r8, r1
	mov sb, r2
	mov sl, r3
	ldr r6, [sp, #0x20]
	ldr r7, [sp, #0x24]
	ldr r1, [sp, #0x30]
	cmp r1, #0
	bne _080B3268
	ldr r0, _080B3264 @ =0x08A9DD64
	movs r1, #3
	b _080B326A
	.align 2, 0
_080B3264: .4byte 0x08A9DD64
_080B3268:
	ldr r0, _080B32C4 @ =0x08A9DD64
_080B326A:
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x34
	mov r1, r8
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x35
	ldr r0, [sp, #0x28]
	strb r0, [r1]
	cmp r7, #0
	bge _080B328A
	movs r7, #0x80
	lsls r7, r7, #7
_080B328A:
	cmp r6, #0
	bge _080B3290
	movs r6, #0
_080B3290:
	mov r0, r8
	bl GetBackgroundTileDataOffset
	str r0, [r4, #0x3c]
	str r6, [r4, #0x40]
	str r7, [r4, #0x48]
	mov r2, sb
	strh r2, [r4, #0x30]
	mov r6, sl
	strh r6, [r4, #0x32]
	ldr r0, [sp, #0x2c]
	str r0, [r4, #0x58]
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov r2, sb
	rsbs r1, r2, #0
	movs r3, #0xff
	ands r1, r3
	mov r6, sl
	rsbs r2, r6, #0
	ands r2, r3
	bl BG_SetPosition
	b _080B32D2
	.align 2, 0
_080B32C4: .4byte 0x08A9DD64
_080B32C8:
	ldrb r0, [r5, #0xa]
	ldr r1, [r4, #0x4c]
	adds r1, r1, r0
	str r1, [r4, #0x4c]
	adds r5, #0xc
_080B32D2:
	ldrb r0, [r5]
	cmp r0, #9
	bls _080B32C8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

