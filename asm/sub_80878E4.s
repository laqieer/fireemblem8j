	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_80878E4, "ax", %progbits
@ sub_80878E4 @ JP 0x080878E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80878E4
	.thumb_func
sub_80878E4:
	push {lr}
	ldr r0, [r0, #0x14]
	adds r0, #0x4c
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08087914
	bl sub_8000CD8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08087936
	ldr r0, _08087910 @ =0x0202BCAC
	ldrh r1, [r0, #0xc]
	movs r2, #2
	eors r1, r2
	strh r1, [r0, #0xc]
	b _08087936
	.align 2, 0
_08087910: .4byte 0x0202BCAC
_08087914:
	bl sub_8000CD8
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08087936
	bl sub_8000CD8
	adds r1, r0, #0
	movs r0, #2
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl BG_SetPosition
_08087936:
	pop {r0}
	bx r0
	.align 2, 0

