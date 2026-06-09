	.syntax unified
	.set LoadRNState, 0x08000C0C + 1
	.set sub_80316E0, 0x080316E0 + 1
	.section .text.sub_80317DC, "ax", %progbits
@ sub_80317DC @ JP 0x080317DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80317DC
	.thumb_func
sub_80317DC:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080317FC @ =0x0203A95A
	adds r0, r4, #0
	bl LoadRNState
	adds r0, r5, #0
	bl sub_80316E0
	subs r4, #6
	adds r0, r4, #0
	bl LoadRNState
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080317FC: .4byte 0x0203A95A

