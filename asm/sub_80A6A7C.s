	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.section .text.sub_80A6A7C, "ax", %progbits
@ sub_80A6A7C @ JP 0x080A6A7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6A7C
	.thumb_func
sub_80A6A7C:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080A6AA4 @ =0x02014EEC
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl __divsi3
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl __modsi3
	cmp r0, #0
	ble _080A6A9C
	adds r6, #1
_080A6A9C:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A6AA4: .4byte 0x02014EEC

