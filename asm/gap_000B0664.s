	.syntax unified
@ Residual Thumb function at ROM 0x080B0664 (52 bytes), formerly kept as raw
@ data/residual/gap_000B0664.bin INCBIN. Sign-extends two bytes, calls
@ Proc_StartBlocking, then writes fields into the returned proc. The literal-pool
@ word is a DATA pointer 0x08A9D668 = SaveMenuSubSelBoxTexts + 0x1c, emitted
@ symbolically (no Thumb bit) so it stays shift-safe.
	.section .text.gap_000B0664, "ax", %progbits
	.thumb
	.align 2
	.global gap_000B0664
	.thumb_func
gap_000B0664:
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #24
	asrs r4, r4, #24
	lsls r5, r5, #24
	lsrs r5, r5, #24
	ldr r0, [pc, #28]
	adds r1, r3, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r0, #42
	movs r1, #0
	strb r4, [r0, #0]
	adds r0, #1
	strb r5, [r0, #0]
	subs r0, #2
	strb r1, [r0, #0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.2byte 0
	.4byte SaveMenuSubSelBoxTexts + 0x1c
