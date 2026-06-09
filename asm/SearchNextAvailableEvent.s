	.syntax unified
	.set sub_80851FC, 0x080851FC + 1
	.section .text.SearchNextAvailableEvent, "ax", %progbits
@ SearchNextAvailableEvent @ JP 0x08085260 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SearchNextAvailableEvent
	.thumb_func
SearchNextAvailableEvent:
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	bne _0808526C
	movs r0, #0
	b _08085286
_0808526C:
	ldr r2, [r3]
	ldrh r1, [r2]
	ldr r0, _0808528C @ =0x08A5A618
	lsls r1, r1, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	lsls r0, r0, #2
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r3, #0
	bl sub_80851FC
_08085286:
	pop {r1}
	bx r1
	.align 2, 0
_0808528C: .4byte 0x08A5A618

