	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_805F63C, 0x0805F63C + 1
	.section .text.sub_805F610, "ax", %progbits
@ sub_805F610 @ JP 0x0805F610 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805F610
	.thumb_func
sub_805F610:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0805F616:
	ldr r0, [r5, #0x5c]
	adds r1, r4, #0
	bl sub_805F63C
	adds r4, #1
	cmp r4, #0x1f
	ble _0805F616
	ldr r1, _0805F638 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl sub_8002DE4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F638: .4byte 0x0201774C

