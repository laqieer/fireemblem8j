		.syntax unified
	.section .text.gap_00024670, "ax", %progbits
@ gap_00024670 @ JP 0x08024670 - Thumb function disassembled from residual gap
@ [0x024670,0x024690) (was data/residual/gap_00024670.bin baserom incbin). A subtitle
@ help handler: GetStringFromIndex(0x7E7) -> StartSubtitleHelp(str, r4). Literal pool
@ holds the string-index CONSTANT 0x7E7; a trailing `bx lr` stub + pad fills the unit
@ to 32 bytes. Referenced as a menu function pointer (frontier_df4_uistuff:
@ gap_00024670 + 0x1).
	.thumb
	.align 2
	.global gap_00024670
	.thumb_func
gap_00024670:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [pc, #16]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.4byte 0x000007E7
	bx lr
	.2byte 0
