	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.section .text.sub_80A6A30, "ax", %progbits
@ sub_80A6A30 @ JP 0x080A6A30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6A30
	.thumb_func
sub_80A6A30:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	ldr r0, _080A6A6C @ =0x02014EEC
	str r4, [r0]
	ldr r1, _080A6A70 @ =0x02014EF0
	movs r0, #1
	lsls r0, r4
	subs r0, #1
	str r0, [r1]
	ldr r6, _080A6A74 @ =0x02014EF4
	movs r0, #0x1e
	adds r1, r4, #0
	bl __divsi3
	adds r5, r0, #0
	str r5, [r6]
	movs r0, #0x1e
	adds r1, r4, #0
	bl __modsi3
	cmp r0, #0
	ble _080A6A62
	adds r0, r5, #1
	str r0, [r6]
_080A6A62:
	ldr r0, _080A6A78 @ =0x02014EF8
	str r7, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6A6C: .4byte 0x02014EEC
_080A6A70: .4byte 0x02014EF0
_080A6A74: .4byte 0x02014EF4
_080A6A78: .4byte 0x02014EF8

