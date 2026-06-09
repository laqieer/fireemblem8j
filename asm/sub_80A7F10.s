	.syntax unified
	.set GetUnitsAverageSupportValue, 0x080A7EAC + 1
	.set sub_8086AC4, 0x08086AC4 + 1
	.section .text.sub_80A7F10, "ax", %progbits
@ sub_80A7F10 @ JP 0x080A7F10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7F10
	.thumb_func
sub_80A7F10:
	push {r4, r5, r6, lr}
	movs r5, #0
	bl sub_8086AC4
	adds r4, r0, #0
	ldrh r0, [r4]
	ldr r1, _080A7F40 @ =0x0000FFFF
	cmp r0, r1
	beq _080A7F36
	adds r6, r1, #0
_080A7F24:
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	bl GetUnitsAverageSupportValue
	adds r5, r5, r0
	adds r4, #0x10
	ldrh r0, [r4]
	cmp r0, r6
	bne _080A7F24
_080A7F36:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A7F40: .4byte 0x0000FFFF

