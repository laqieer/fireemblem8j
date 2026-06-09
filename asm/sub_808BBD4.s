	.syntax unified
	.set InitSpriteText, 0x080044E0 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80044A4, 0x080044A4 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_808BBD4, "ax", %progbits
@ sub_808BBD4 @ JP 0x0808BBD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808BBD4
	.thumb_func
sub_808BBD4:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r5, #0
	bne _0808BBE0
	ldr r5, _0808BC70 @ =0x06013000
_0808BBE0:
	cmp r6, #0
	bge _0808BBE6
	movs r6, #5
_0808BBE6:
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r6
	adds r6, r0, #0
	adds r6, #0x10
	ldr r0, _0808BC74 @ =0x08A74914
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808BC78 @ =0x08A7493C
	movs r2, #0xec
	lsls r2, r2, #3
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808BC7C @ =0x08A74964
	movs r2, #0xb6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808BC80 @ =0x08A749CC
	movs r2, #0xf6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808BC84 @ =0x08A74A38
	movs r2, #0x9b
	lsls r2, r2, #5
	adds r1, r5, r2
	bl sub_8013008
	ldr r7, _0808BC88 @ =0x0203E790
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_80044A4
	adds r0, r7, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r7, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r1, r7, #0
	adds r1, #0x2c
	movs r0, #0
	strb r0, [r1]
	bl SetTextFont
	ldr r0, _0808BC8C @ =0x085C7460
	lsls r1, r6, #5
	movs r2, #0x20
	bl sub_8000D68
	lsls r0, r5, #0x11
	lsrs r0, r0, #0x16
	ands r6, r4
	lsls r1, r6, #0xc
	adds r0, r0, r1
	strh r0, [r7, #0x30]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808BC70: .4byte 0x06013000
_0808BC74: .4byte 0x08A74914
_0808BC78: .4byte 0x08A7493C
_0808BC7C: .4byte 0x08A74964
_0808BC80: .4byte 0x08A749CC
_0808BC84: .4byte 0x08A74A38
_0808BC88: .4byte 0x0203E790
_0808BC8C: .4byte 0x085C7460

