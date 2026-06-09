	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.set sub_8080CB8, 0x08080CB8 + 1
	.section .text.sub_807FA1C, "ax", %progbits
@ sub_807FA1C @ JP 0x0807FA1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807FA1C
	.thumb_func
sub_807FA1C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	movs r0, #0xb6
	bl sub_8014B50
	ldr r2, _0807FA9C @ =0x03003020
	ldrb r3, [r2, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	adds r0, r1, #0
	ands r0, r3
	orrs r0, r4
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r2, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, [r5, #0x50]
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807FAA0 @ =0x06002800
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, [r5, #0x54]
	movs r1, #0x80
	movs r2, #0x20
	bl sub_8000D68
	bl sub_8080CB8
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r5, #0x40
	movs r0, #0
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FA9C: .4byte 0x03003020
_0807FAA0: .4byte 0x06002800

