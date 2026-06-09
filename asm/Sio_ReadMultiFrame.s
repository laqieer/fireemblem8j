	.syntax unified
	.section .text.Sio_ReadMultiFrame, "ax", %progbits
@ Sio_ReadMultiFrame @ JP 0x08042538 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Sio_ReadMultiFrame
	.thumb_func
Sio_ReadMultiFrame:
	push {r4, r5, r6, lr}
	adds r2, r1, #0
	ldr r3, _08042560 @ =0x030017F0
	ldr r1, _08042564 @ =0x030017F8
	ldrh r0, [r3]
	ldrh r1, [r1]
	cmp r0, r1
	bne _0804256C
	ldr r1, _08042568 @ =0x00007FFF
	adds r0, r1, #0
	strh r0, [r2]
	adds r2, #2
	strh r0, [r2]
	adds r2, #2
	strh r0, [r2]
	strh r0, [r2, #2]
	movs r0, #2
	rsbs r0, r0, #0
	b _08042594
	.align 2, 0
_08042560: .4byte 0x030017F0
_08042564: .4byte 0x030017F8
_08042568: .4byte 0x00007FFF
_0804256C:
	movs r4, #0
	ldr r6, _0804259C @ =0x0203CA20
	ldr r5, _080425A0 @ =0x000001FF
_08042572:
	lsls r1, r4, #1
	ldrh r0, [r3]
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r6
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3]
	adds r0, #1
	ands r0, r5
	strh r0, [r3]
	adds r3, #2
	adds r4, #1
	cmp r4, #3
	ble _08042572
	movs r0, #0
_08042594:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804259C: .4byte 0x0203CA20
_080425A0: .4byte 0x000001FF

