	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.section .text.sub_808A570, "ax", %progbits
@ sub_808A570 @ JP 0x0808A570 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808A570
	.thumb_func
sub_808A570:
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _0808A5D0 @ =0x02003BFC
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0xe4
	movs r3, #6
	ldrsh r2, [r4, r3]
	adds r2, #0x11
	ldr r5, _0808A5D4 @ =0x085B8CDC
	ldrb r0, [r4, #1]
	ldr r3, _0808A5D8 @ =0x00004E89
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0xde
	movs r3, #6
	ldrsh r2, [r4, r3]
	adds r2, #0x11
	ldr r0, _0808A5D8 @ =0x00004E89
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0xd7
	movs r3, #6
	ldrsh r2, [r4, r3]
	adds r2, #0x11
	ldrb r0, [r4]
	ldr r3, _0808A5DC @ =0x00004E8A
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A5D0: .4byte 0x02003BFC
_0808A5D4: .4byte 0x085B8CDC
_0808A5D8: .4byte 0x00004E89
_0808A5DC: .4byte 0x00004E8A

