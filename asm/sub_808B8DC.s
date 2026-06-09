	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.set sub_808B894, 0x0808B894 + 1
	.section .text.sub_808B8DC, "ax", %progbits
@ sub_808B8DC @ JP 0x0808B8DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B8DC
	.thumb_func
sub_808B8DC:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, _0808B920 @ =0x08A732C0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r6, r0, #2
	adds r0, r7, #4
	adds r5, r6, r0
	ldr r0, [r5]
	cmp r0, #0
	beq _0808B930
	ldr r0, _0808B924 @ =0x08A8BFA4
	lsls r4, r4, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl sub_8013008
	ldr r0, [r5]
	ldr r2, _0808B928 @ =0x06000020
	adds r1, r4, r2
	bl sub_8013008
	adds r0, r7, #0
	adds r0, #8
	adds r0, r6, r0
	ldr r0, [r0]
	ldr r1, _0808B92C @ =0x060002A0
	adds r4, r4, r1
	adds r1, r4, #0
	bl sub_8013008
	b _0808B936
	.align 2, 0
_0808B920: .4byte 0x08A732C0
_0808B924: .4byte 0x08A8BFA4
_0808B928: .4byte 0x06000020
_0808B92C: .4byte 0x060002A0
_0808B930:
	adds r0, r4, #0
	bl sub_808B894
_0808B936:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

