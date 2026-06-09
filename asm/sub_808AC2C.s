	.syntax unified
	.set sub_808B3F0, 0x0808B3F0 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.section .text.sub_808AC2C, "ax", %progbits
@ sub_808AC2C @ JP 0x0808AC2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808AC2C
	.thumb_func
sub_808AC2C:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_808BB14
	ldr r1, _0808AC54 @ =0x02003BFC
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _0808AC74
	cmp r4, #1
	beq _0808AC68
	cmp r4, #1
	bgt _0808AC58
	cmp r4, #0
	beq _0808AC5E
	b _0808AC74
	.align 2, 0
_0808AC54: .4byte 0x02003BFC
_0808AC58:
	cmp r4, #2
	beq _0808AC70
	b _0808AC74
_0808AC5E:
	ldr r0, _0808AC64 @ =0x08A72C7C
	b _0808AC72
	.align 2, 0
_0808AC64: .4byte 0x08A72C7C
_0808AC68:
	ldr r0, _0808AC6C @ =0x08A72E58
	b _0808AC72
	.align 2, 0
_0808AC6C: .4byte 0x08A72E58
_0808AC70:
	ldr r0, _0808AC84 @ =0x08A72FFC
_0808AC72:
	str r0, [r1, #0x14]
_0808AC74:
	ldr r0, _0808AC88 @ =0x02003BFC
	ldr r0, [r0, #0x14]
	adds r1, r5, #0
	bl sub_808B3F0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808AC84: .4byte 0x08A72FFC
_0808AC88: .4byte 0x02003BFC

