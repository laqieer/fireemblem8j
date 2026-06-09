	.syntax unified
	.set UnitHasMagicRank, 0x0801876C + 1
	.section .text.sub_808AD94, "ax", %progbits
@ sub_808AD94 @ JP 0x0808AD94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808AD94
	.thumb_func
sub_808AD94:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808ADB0 @ =0x02003BFC
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808ADB8
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r0, _0808ADB4 @ =0x000004DC
	b _0808ADBE
	.align 2, 0
_0808ADB0: .4byte 0x02003BFC
_0808ADB4: .4byte 0x000004DC
_0808ADB8:
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r0, _0808ADC8 @ =0x000004DB
_0808ADBE:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808ADC8: .4byte 0x000004DB

