	.syntax unified
	.section .text.AddMenuOverride, "ax", %progbits
@ AddMenuOverride @ JP 0x080504F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AddMenuOverride
	.thumb_func
AddMenuOverride:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _080504F8 @ =0x03001868
	b _080504FE
	.align 2, 0
_080504F8: .4byte 0x03001868
_080504FC:
	adds r3, #8
_080504FE:
	movs r5, #2
	ldrsh r0, [r3, r5]
	cmp r0, #0
	beq _08050512
	cmp r0, r1
	bne _080504FC
	movs r5, #0
	ldrsh r0, [r3, r5]
	cmp r0, r4
	bne _080504FC
_08050512:
	strh r4, [r3]
	strh r1, [r3, #2]
	str r2, [r3, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

