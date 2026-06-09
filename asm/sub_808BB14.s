	.syntax unified
	.set InitSpriteText, 0x080044E0 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80044A4, 0x080044A4 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_808BB14, "ax", %progbits
@ sub_808BB14 @ JP 0x0808BB14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808BB14
	.thumb_func
sub_808BB14:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r5, #0
	bne _0808BB20
	ldr r5, _0808BBB4 @ =0x06013000
_0808BB20:
	cmp r6, #0
	bge _0808BB26
	movs r6, #5
_0808BB26:
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r6
	adds r6, r0, #0
	adds r6, #0x10
	ldr r0, _0808BBB8 @ =0x08A74914
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808BBBC @ =0x08A7493C
	movs r2, #0xec
	lsls r2, r2, #3
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808BBC0 @ =0x08A74964
	movs r2, #0xb6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808BBC4 @ =0x08A749CC
	movs r2, #0xf6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl sub_8013008
	ldr r0, _0808BBC8 @ =0x08A74A38
	movs r2, #0x9b
	lsls r2, r2, #5
	adds r1, r5, r2
	bl sub_8013008
	ldr r7, _0808BBCC @ =0x0203E790
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
	adds r0, r7, #0
	adds r0, #0x28
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	ldr r0, _0808BBD0 @ =0x085C7460
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
_0808BBB4: .4byte 0x06013000
_0808BBB8: .4byte 0x08A74914
_0808BBBC: .4byte 0x08A7493C
_0808BBC0: .4byte 0x08A74964
_0808BBC4: .4byte 0x08A749CC
_0808BBC8: .4byte 0x08A74A38
_0808BBCC: .4byte 0x0203E790
_0808BBD0: .4byte 0x085C7460

