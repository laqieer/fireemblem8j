	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8053668, 0x08053668 + 1
	.set sub_8053A7C, 0x08053A7C + 1
	.section .text.sub_80564B4, "ax", %progbits
@ sub_80564B4 @ JP 0x080564B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80564B4
	.thumb_func
sub_80564B4:
	push {r4, lr}
	adds r4, r1, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080564CC
	ldr r0, _080564C8 @ =0x02000000
	ldr r0, [r0]
	b _080564D0
	.align 2, 0
_080564C8: .4byte 0x02000000
_080564CC:
	ldr r0, _080564DC @ =0x02000000
	ldr r0, [r0, #8]
_080564D0:
	cmp r4, #0
	beq _080564E0
	cmp r4, #1
	beq _080564E6
	b _080564EA
	.align 2, 0
_080564DC: .4byte 0x02000000
_080564E0:
	bl sub_8053A7C
	b _080564EA
_080564E6:
	bl sub_8053668
_080564EA:
	pop {r4}
	pop {r0}
	bx r0

