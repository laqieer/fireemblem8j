	.syntax unified
	.section .text.ResetMenuOverrides, "ax", %progbits
@ ResetMenuOverrides @ JP 0x0805046C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ResetMenuOverrides
	.thumb_func
ResetMenuOverrides:
	push {lr}
	ldr r1, _08050484 @ =0x03001868
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x78
_08050476:
	strh r2, [r0, #2]
	subs r0, #8
	cmp r0, r1
	bge _08050476
	pop {r0}
	bx r0
	.align 2, 0
_08050484: .4byte 0x03001868

