	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.section .text.sub_80A40D4, "ax", %progbits
@ sub_80A40D4 @ JP 0x080A40D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A40D4
	.thumb_func
sub_80A40D4:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	bne _080A40F8
	ldr r4, _080A40F4 @ =0x08A95650
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #4
	b _080A411E
	.align 2, 0
_080A40F4: .4byte 0x08A95650
_080A40F8:
	cmp r0, #1
	beq _080A4110
	ldr r4, _080A410C @ =0x08A95650
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #0xc
	b _080A411E
	.align 2, 0
_080A410C: .4byte 0x08A95650
_080A4110:
	ldr r4, _080A4128 @ =0x08A95650
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r4, #8
_080A411E:
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A4128: .4byte 0x08A95650

