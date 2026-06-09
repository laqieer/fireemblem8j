	.syntax unified
	.set AddGmPath, 0x080C16FC + 1
	.section .text.sub_80AB924, "ax", %progbits
@ sub_80AB924 @ JP 0x080AB924 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB924
	.thumb_func
sub_80AB924:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r1, r5, #0
	adds r1, #0xc4
	movs r0, #0
	strb r0, [r1]
	movs r4, #0
_080AB934:
	adds r0, r4, #0
	cmp r4, #0
	bge _080AB93C
	adds r0, r4, #7
_080AB93C:
	asrs r0, r0, #3
	adds r0, r6, r0
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r4
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _080AB95C
	adds r0, r5, #0
	adds r1, r5, #0
	adds r1, #0xa4
	adds r2, r4, #0
	bl AddGmPath
_080AB95C:
	adds r4, #1
	cmp r4, #0x1f
	ble _080AB934
	pop {r4, r5, r6}
	pop {r0}
	bx r0

