	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBgXOffset, 0x080B34A0 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_808793C, "ax", %progbits
@ sub_808793C @ JP 0x0808793C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808793C
	.thumb_func
sub_808793C:
	push {lr}
	ldr r0, [r0, #0x14]
	adds r0, #0x4c
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08087974
	bl sub_8000CD8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08087998
	ldr r2, _0808796C @ =0x0202BCAC
	ldrh r1, [r2, #0xc]
	ldr r0, _08087970 @ =0x0000FFFD
	ands r0, r1
	movs r1, #1
	eors r0, r1
	strh r0, [r2, #0xc]
	b _08087998
	.align 2, 0
_0808796C: .4byte 0x0202BCAC
_08087970: .4byte 0x0000FFFD
_08087974:
	bl sub_8000CD8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08087998
	movs r0, #3
	bl GetBgXOffset
	adds r1, r0, #0
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl BG_SetPosition
_08087998:
	pop {r0}
	bx r0

