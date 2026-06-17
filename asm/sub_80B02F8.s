	.syntax unified
	.set BitfileToIndex, 0x080AD2D0 + 1
	.set SaveMenuDrawSubSelBoxExt, 0x080B0278 + 1
	.section .text.sub_80B02F8, "ax", %progbits
@ sub_80B02F8 @ JP 0x080B02F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B02F8
	.thumb_func
sub_80B02F8:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	asrs r5, r1, #0x18
	ldr r4, _080B0328 @ =0x08A9D64C
	adds r0, #0x42
	ldrb r0, [r0]
	bl BitfileToIndex
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r4
	ldr r0, [r0]
	adds r1, r5, #0
	bl SaveMenuDrawSubSelBoxExt
	cmp r5, #0
	bne _080B0322
	adds r0, r6, #0
	adds r0, #0x36
	strb r5, [r0]
_080B0322:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B0328: .4byte 0x08A9D64C

