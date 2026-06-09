	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.section .text.sub_8031530, "ax", %progbits
@ sub_8031530 @ JP 0x08031530 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8031530
	.thumb_func
sub_8031530:
	push {r4, r5, lr}
	adds r3, r0, #0
	bl GetItemIndex
	adds r3, r0, #0
	movs r2, #0
	movs r5, #0xff
	ldr r4, _08031550 @ =0x0203A818
_08031540:
	ldrh r1, [r4]
	adds r0, r5, #0
	ands r0, r1
	cmp r3, r0
	bne _08031554
	adds r0, r2, #0
	b _08031560
	.align 2, 0
_08031550: .4byte 0x0203A818
_08031554:
	adds r4, #2
	adds r2, #1
	cmp r2, #0x63
	ble _08031540
	movs r0, #1
	rsbs r0, r0, #0
_08031560:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

