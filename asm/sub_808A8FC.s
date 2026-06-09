	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetPortraitData, 0x0800541C + 1
	.set ResetText, 0x08003BC4 + 1
	.set StartUiMu, 0x0807A918 + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8005D9C, 0x08005D9C + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_80890AC, 0x080890AC + 1
	.set sub_8089100, 0x08089100 + 1
	.set sub_8089B58, 0x08089B58 + 1
	.section .text.sub_808A8FC, "ax", %progbits
@ sub_808A8FC @ JP 0x0808A8FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808A8FC
	.thumb_func
sub_808A8FC:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, _0808A958 @ =0x02003BFC
	ldr r0, [r5, #0xc]
	bl sub_8018FCC
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808A91C
	adds r4, #1
_0808A91C:
	movs r0, #3
	strb r0, [r5, #1]
	bl ResetText
	bl sub_80034C4
	bl sub_80890AC
	ldr r1, _0808A95C @ =0x02023CEA
	movs r3, #0x9c
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	adds r0, r6, #0
	adds r2, r4, #0
	bl sub_8005D9C
	adds r0, r4, #0
	bl GetPortraitData
	ldr r0, [r0]
	cmp r0, #0
	beq _0808A964
	ldr r0, _0808A960 @ =0x08A73F9C
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
	b _0808A96E
	.align 2, 0
_0808A958: .4byte 0x02003BFC
_0808A95C: .4byte 0x02023CEA
_0808A960: .4byte 0x08A73F9C
_0808A964:
	ldr r0, _0808A9B0 @ =0x08A73FBC
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
_0808A96E:
	bl sub_807B4B8
	ldr r4, _0808A9B4 @ =0x02003BFC
	ldr r0, [r4, #0xc]
	movs r1, #0x50
	movs r2, #0x8a
	bl StartUiMu
	str r0, [r4, #0x10]
	bl sub_8089100
	ldrb r0, [r4]
	bl sub_8089B58
	ldr r0, _0808A9B8 @ =0x02003D2C
	ldr r1, _0808A9BC @ =0x02022D40
	movs r2, #0x12
	movs r3, #0x12
	bl j_TmCopyRect
	ldr r0, _0808A9C0 @ =0x0200472C
	ldr r1, _0808A9C4 @ =0x02023D40
	movs r2, #0x12
	movs r3, #0x12
	bl j_TmCopyRect
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A9B0: .4byte 0x08A73FBC
_0808A9B4: .4byte 0x02003BFC
_0808A9B8: .4byte 0x02003D2C
_0808A9BC: .4byte 0x02022D40
_0808A9C0: .4byte 0x0200472C
_0808A9C4: .4byte 0x02023D40

