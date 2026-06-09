	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_808B9C0, "ax", %progbits
@ sub_808B9C0 @ JP 0x0808B9C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B9C0
	.thumb_func
sub_808B9C0:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0808BA08 @ =0x0203E788
	ldrh r0, [r0, #2]
	lsls r5, r1, #0xc
	adds r3, r0, r5
	ldr r1, _0808BA0C @ =0x08A732C0
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0808BA1C
	ldr r0, _0808BA10 @ =0x08A92410
	ldr r4, _0808BA14 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _0808BA18 @ =0x02022CA8
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r2, r1, #0
	adds r2, r5, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r1, r4, #0
	bl j_TmApplyTsa
	movs r0, #0
	movs r1, #0
	movs r2, #2
	bl BG_SetPosition
	b _0808BA2A
	.align 2, 0
_0808BA08: .4byte 0x0203E788
_0808BA0C: .4byte 0x08A732C0
_0808BA10: .4byte 0x08A92410
_0808BA14: .4byte 0x02020188
_0808BA18: .4byte 0x02022CA8
_0808BA1C:
	movs r0, #0x3f
_0808BA1E:
	strh r3, [r4]
	adds r3, #1
	adds r4, #2
	subs r0, #1
	cmp r0, #0
	bge _0808BA1E
_0808BA2A:
	pop {r4, r5}
	pop {r0}
	bx r0

