	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.section .text.sub_808A5E0, "ax", %progbits
@ sub_808A5E0 @ JP 0x0808A5E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808A5E0
	.thumb_func
sub_808A5E0:
	push {lr}
	sub sp, #4
	ldr r0, _0808A604 @ =0x02003BFC
	movs r2, #4
	ldrsh r1, [r0, r2]
	adds r1, #0x40
	movs r3, #6
	ldrsh r2, [r0, r3]
	adds r2, #0x83
	ldr r3, _0808A608 @ =0x085B8D24
	ldr r0, _0808A60C @ =0x00004E8F
	str r0, [sp]
	movs r0, #0xb
	bl PutSprite
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0808A604: .4byte 0x02003BFC
_0808A608: .4byte 0x085B8D24
_0808A60C: .4byte 0x00004E8F

