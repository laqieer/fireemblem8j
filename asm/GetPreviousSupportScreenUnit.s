	.syntax unified
	.section .text.GetPreviousSupportScreenUnit, "ax", %progbits
@ GetPreviousSupportScreenUnit @ JP 0x080A48A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetPreviousSupportScreenUnit
	.thumb_func
GetPreviousSupportScreenUnit:
	push {lr}
	cmp r0, #0
	bne _080A48B2
	ldr r0, _080A48B8 @ =0x020136E8
	ldr r0, [r0]
_080A48B2:
	subs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_080A48B8: .4byte 0x020136E8

