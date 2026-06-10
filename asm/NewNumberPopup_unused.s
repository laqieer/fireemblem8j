	.syntax unified
	.set NewPopup_Simple, 0x08011560 + 1
	.set SetPopupUnit, 0x08011554 + 1
	.section .text.NewNumberPopup_unused, "ax", %progbits
@ NewNumberPopup_unused @ JP 0x08011710 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewNumberPopup_unused
	.thumb_func
NewNumberPopup_unused:
	push {r4, lr}
	adds r4, r1, #0
	bl SetPopupUnit
	ldr r0, _0801172C @ =0x085BA0C4
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopup_Simple
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801172C: .4byte 0x085BA0C4

