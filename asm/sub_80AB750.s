	.syntax unified
	.set GetGlobalCompletionCount, 0x080A95F4 + 1
	.section .text.sub_80AB750, "ax", %progbits
@ sub_80AB750 @ JP 0x080AB750 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB750
	.thumb_func
sub_80AB750:
	push {lr}
	bl GetGlobalCompletionCount
	ldr r1, _080AB760 @ =0x0202E4E8
	movs r0, #0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080AB760: .4byte 0x0202E4E8

