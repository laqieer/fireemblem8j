	.syntax unified
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set SetMuScreenPosition, 0x0807BBF8 + 1
	.section .text.sub_808A0B4, "ax", %progbits
@ sub_808A0B4 @ JP 0x0808A0B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808A0B4
	.thumb_func
sub_808A0B4:
	push {r4, lr}
	ldr r4, _0808A100 @ =0x02003BFC
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _0808A0C6
	movs r1, #0x50
	movs r2, #0x8a
	bl SetMuScreenPosition
_0808A0C6:
	ldr r3, _0808A104 @ =0x03003020
	ldrb r1, [r3, #0xc]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	ldrb r0, [r3, #0x10]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	bl SetDefaultColorEffects
	movs r0, #0
	strb r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A100: .4byte 0x02003BFC
_0808A104: .4byte 0x03003020

