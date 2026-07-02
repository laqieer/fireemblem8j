	.syntax unified
	.section .text.gap_00003080, "ax", %progbits
@ gap_00003080 @ JP 0x08003080 - Thumb function disassembled from residual gap
@ [0x003080,0x00309C) (was data/residual/gap_00003080.bin baserom incbin). Tail-calls
@ through the _call_via_r3 libgcc thunk; no literal pool.
	.thumb
	.global gap_00003080
	.thumb_func
gap_00003080:
	push {lr}
	adds r1, r0, #0
	ldr r2, [r1, #4]
	movs r3, #2
	ldrsh r0, [r2, r3]
	ldr r3, [r2, #4]
	adds r2, #8
	str r2, [r1, #4]
	bl _call_via_r3
	lsls r0, r0, #24
	asrs r0, r0, #24
	pop {r1}
	bx r1
