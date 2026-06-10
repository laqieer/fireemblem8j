	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.section .text.sub_802B328, "ax", %progbits
@ sub_802B328 @ JP 0x0802B328 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802B328
	.thumb_func
sub_802B328:
	push {lr}
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _0802B33C
	ldr r1, _0802B340 @ =0x0203A4D0
	movs r0, #0
	strh r0, [r1, #4]
_0802B33C:
	pop {r0}
	bx r0
	.align 2, 0
_0802B340: .4byte 0x0203A4D0

