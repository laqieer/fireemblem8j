	.syntax unified
	.set sub_804F634, 0x0804F634 + 1
	.set sub_804F698, 0x0804F698 + 1
	.section .text.sub_802D2F8, "ax", %progbits
@ sub_802D2F8 @ JP 0x0802D2F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802D2F8
	.thumb_func
sub_802D2F8:
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r4, [r3, #0x14]
	ldr r0, [r3, #0x40]
	ldr r2, _0802D368 @ =0x00FFFF00
	ands r0, r2
	ldr r1, [r4, #0x40]
	ands r1, r2
	cmp r0, r1
	beq _0802D362
	adds r5, r3, #0
	adds r5, #0x41
	ldrb r0, [r5]
	adds r7, r3, #0
	adds r7, #0x42
	cmp r0, #0xff
	beq _0802D336
	ldr r2, _0802D36C @ =0x085C3FBC
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r0, [r7]
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	movs r2, #0xc
	bl sub_804F698
_0802D336:
	ldr r2, _0802D36C @ =0x085C3FBC
	adds r6, r4, #0
	adds r6, #0x42
	adds r4, #0x41
	ldrb r0, [r4]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r0, [r6]
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	movs r2, #0xc
	bl sub_804F634
	ldrb r0, [r4]
	strb r0, [r5]
	ldrb r0, [r6]
	strb r0, [r7]
_0802D362:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D368: .4byte 0x00FFFF00
_0802D36C: .4byte 0x085C3FBC

