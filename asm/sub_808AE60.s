	.syntax unified
	.section .text.sub_808AE60, "ax", %progbits
@ sub_808AE60 @ JP 0x0808AE60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808AE60
	.thumb_func
sub_808AE60:
	push {lr}
	adds r1, r0, #0
	ldr r0, _0808AE78 @ =0x02003BFC
	ldr r0, [r0, #0xc]
	ldr r0, [r0]
	ldrh r2, [r0, #2]
	cmp r2, #0
	beq _0808AE7C
	adds r0, r1, #0
	adds r0, #0x4c
	strh r2, [r0]
	b _0808AE82
	.align 2, 0
_0808AE78: .4byte 0x02003BFC
_0808AE7C:
	adds r1, #0x4c
	ldr r0, _0808AE88 @ =0x0000063F
	strh r0, [r1]
_0808AE82:
	pop {r0}
	bx r0
	.align 2, 0
_0808AE88: .4byte 0x0000063F

