	.syntax unified
@ Residual Thumb code at ROM 0x08024818 (92 bytes), formerly kept as raw
@ data/residual/gap_00024818.bin INCBIN. Three identical subtitle-help handlers
@ (GetStringFromIndex(idx) -> StartSubtitleHelp). Kept as a single anchor symbol
@ gap_00024818: the frontier menu table references gap_00024818 + 0x1 / + 0x1d /
@ + 0x41 (all odd -> carry the Thumb bit), which resolve unchanged. Literal pools
@ hold the string-index CONSTANTS 0x7FE / 0x7FE / 0x7FF (.4byte, not pointers).
	.section .text.gap_00024818, "ax", %progbits
	.thumb
	.align 2
	.global gap_00024818
	.thumb_func
gap_00024818:
	@ handler 1 @ 0x08024818 (table ref: gap_00024818 + 0x1)
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
	.4byte 0x000007FE
	bx lr                    @ 0x08024834 (table ref: gap_00024818 + 0x1d)
	.2byte 0
	@ handler 2 @ 0x08024838
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
	.4byte 0x000007FE
	bx lr                    @ 0x08024854
	.2byte 0
	@ handler 3 @ 0x08024858 (table ref: gap_00024818 + 0x41)
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
	.4byte 0x000007FF
