	.syntax unified
	.section .text.SetTalkFaceLayer, "ax", %progbits
@ SetTalkFaceLayer @ JP 0x08007890 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetTalkFaceLayer
	.thumb_func
SetTalkFaceLayer:
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	cmp r1, #0
	bne _080078E2
	movs r7, #5
	movs r6, #6
	cmp r3, #0
	blt _080078A8
	cmp r3, #2
	ble _080078A8
	cmp r3, #5
	ble _080078AE
_080078A8:
	movs r1, #0
	movs r4, #2
	b _080078B2
_080078AE:
	movs r1, #3
	movs r4, #5
_080078B2:
	adds r2, r1, #0
	cmp r2, r4
	bgt _080078E2
	ldr r5, _080078D4 @ =0x085B90D4
_080078BA:
	ldr r0, [r5]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080078DC
	cmp r2, r3
	bne _080078D8
	adds r0, #0x41
	strb r7, [r0]
	b _080078DC
	.align 2, 0
_080078D4: .4byte 0x085B90D4
_080078D8:
	adds r0, #0x41
	strb r6, [r0]
_080078DC:
	adds r2, #1
	cmp r2, r4
	ble _080078BA
_080078E2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

