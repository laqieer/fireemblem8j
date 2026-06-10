	.syntax unified
	.set GetUnitItemCount, 0x08017780 + 1
	.set sub_80013FC, 0x080013FC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8085B30, 0x08085B30 + 1
	.section .text.sub_802DCA4, "ax", %progbits
@ sub_802DCA4 @ JP 0x0802DCA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802DCA4
	.thumb_func
sub_802DCA4:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _0802DD00 @ =0x085C3FFC
	movs r1, #3
	bl sub_8002BCC
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r4, [r2, #0x30]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	adds r5, r2, #0
	adds r5, #0x41
	strb r0, [r5]
	adds r1, #2
	strb r0, [r1]
	adds r4, r2, #0
	adds r4, #0x48
	strb r0, [r4]
	ldr r0, _0802DD04 @ =0x0203A60C
	str r2, [r0]
	bl sub_8085B30
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802DCE8
	movs r0, #0xc9
	bl sub_80013FC
	movs r0, #1
	strb r0, [r4]
_0802DCE8:
	adds r0, r6, #0
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #0
	bne _0802DCF8
	movs r1, #1
	strb r1, [r5]
_0802DCF8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802DD00: .4byte 0x085C3FFC
_0802DD04: .4byte 0x0203A60C

