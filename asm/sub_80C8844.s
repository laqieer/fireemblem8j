	.syntax unified
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.section .text.sub_80C8844, "ax", %progbits
@ sub_80C8844 @ JP 0x080C8844 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8844
	.thumb_func
sub_80C8844:
	push {r4, lr}
	ldr r4, _080C8864 @ =0x0201B458
	adds r0, r4, #0
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl j_TmFillRect
	ldr r1, _080C8868 @ =0x08B2717C
	ldr r2, _080C886C @ =0x000071E0
	adds r0, r4, #0
	bl j_TmApplyTsa
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8864: .4byte 0x0201B458
_080C8868: .4byte 0x08B2717C
_080C886C: .4byte 0x000071E0

