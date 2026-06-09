	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_808164C, "ax", %progbits
@ sub_808164C @ JP 0x0808164C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808164C
	.thumb_func
sub_808164C:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x32]
	adds r0, #8
	strh r0, [r4, #0x32]
	ldrh r2, [r4, #0x32]
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	ldrh r2, [r4, #0x32]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _08081690 @ =0x03004920
	ldr r2, [r0]
	ldrh r1, [r4, #0x32]
	movs r0, #0x20
	subs r0, r0, r1
	strh r0, [r2, #0x36]
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r0, #0x30
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08081688
	adds r0, r4, #0
	bl sub_8002DE4
_08081688:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081690: .4byte 0x03004920

