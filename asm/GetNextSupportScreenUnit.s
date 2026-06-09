	.syntax unified
	.section .text.GetNextSupportScreenUnit, "ax", %progbits
@ GetNextSupportScreenUnit @ JP 0x080A4888 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetNextSupportScreenUnit
	.thumb_func
GetNextSupportScreenUnit:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A489C @ =0x020136E8
	ldr r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080A48A0
	adds r0, r1, #1
	b _080A48A2
	.align 2, 0
_080A489C: .4byte 0x020136E8
_080A48A0:
	movs r0, #0
_080A48A2:
	pop {r1}
	bx r1
	.align 2, 0

