	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.section .text.sub_808F4FC, "ax", %progbits
@ sub_808F4FC @ JP 0x0808F4FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808F4FC
	.thumb_func
sub_808F4FC:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, _0808F574 @ =0x020044D4
	adds r0, r7, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl j_TmFillRect
	ldr r6, _0808F578 @ =0x02004054
	adds r0, r6, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl j_TmFillRect
	adds r5, r4, #0
	adds r5, #0x44
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0808F540
	ldr r1, _0808F57C @ =0x08A93490
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r7, #0
	bl j_TmApplyTsa
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl PutText
_0808F540:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _0808F56C
	ldr r1, _0808F580 @ =0x08A93408
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r7, #0
	bl j_TmApplyTsa
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl PutText
	adds r0, r4, #0
	adds r0, #0x34
	adds r1, r6, #0
	adds r1, #0xc2
	bl PutText
_0808F56C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F574: .4byte 0x020044D4
_0808F578: .4byte 0x02004054
_0808F57C: .4byte 0x08A93490
_0808F580: .4byte 0x08A93408

