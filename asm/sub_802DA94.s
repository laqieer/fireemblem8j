	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set StartItemHelpBox, 0x0808B0EC + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.section .text.sub_802DA94, "ax", %progbits
@ sub_802DA94 @ JP 0x0802DA94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802DA94
	.thumb_func
sub_802DA94:
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x14]
	adds r5, r3, #0
	adds r5, #0x41
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r1, [r0]
	adds r4, r3, #0
	adds r4, #0x42
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	cmp r6, #0
	bne _0802DAC4
	adds r0, r2, #0
	bl Proc_End
	b _0802DB28
_0802DAC4:
	adds r0, r3, #0
	adds r0, #0x45
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802DAF0
	adds r2, r3, #0
	adds r2, #0x47
	adds r0, r3, #0
	adds r0, #0x46
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrb r2, [r2]
	adds r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x34
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
_0802DAF0:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_808BB14
	ldr r2, _0802DB30 @ =0x085C3FBC
	ldrb r0, [r5]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r4, [r4]
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	adds r2, r6, #0
	bl StartItemHelpBox
	ldr r0, _0802DB34 @ =0x085775CC
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	ldr r0, _0802DB38 @ =0x0000FEFD
	ands r0, r1
	strh r0, [r2, #8]
_0802DB28:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DB30: .4byte 0x085C3FBC
_0802DB34: .4byte 0x085775CC
_0802DB38: .4byte 0x0000FEFD

