	.syntax unified
	.set GetItemDescId, 0x080172C0 + 1
	.section .text.sub_808AC8C, "ax", %progbits
@ sub_808AC8C @ JP 0x0808AC8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808AC8C
	.thumb_func
sub_808AC8C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808ACB4 @ =0x02003BFC
	ldr r1, [r0, #0xc]
	ldr r0, [r4, #0x2c]
	ldrh r0, [r0, #0x12]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x4e
	strh r0, [r1]
	bl GetItemDescId
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808ACB4: .4byte 0x02003BFC

