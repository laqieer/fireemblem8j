	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_808B93C, "ax", %progbits
@ sub_808B93C @ JP 0x0808B93C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B93C
	.thumb_func
sub_808B93C:
	push {lr}
	adds r1, r0, #0
	ldr r3, _0808B960 @ =0x0203E788
	ldr r0, _0808B964 @ =0x000003FF
	adds r2, r0, #0
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3]
	ldr r0, _0808B968 @ =0x08A7D10C
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_8013008
	pop {r0}
	bx r0
	.align 2, 0
_0808B960: .4byte 0x0203E788
_0808B964: .4byte 0x000003FF
_0808B968: .4byte 0x08A7D10C

