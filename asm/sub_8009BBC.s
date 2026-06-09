	.syntax unified
	.set InitUnits, 0x0801756C + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set ResetPermanentFlags, 0x08086040 + 1
	.set sub_8030C44, 0x08030C44 + 1
	.set sub_8085F70, 0x08085F70 + 1
	.section .text.sub_8009BBC, "ax", %progbits
@ sub_8009BBC @ JP 0x08009BBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009BBC
	.thumb_func
sub_8009BBC:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #5
	bne _08009BD2
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _08009BF8
_08009BD2:
	movs r0, #0
	movs r1, #0
	bl sub_8030C44
	ldr r4, _08009C00 @ =0x0202BCEC
	ldrb r1, [r4, #0x14]
	movs r0, #8
	orrs r0, r1
	strb r0, [r4, #0x14]
	bl ResetPermanentFlags
	bl sub_8085F70
	bl InitUnits
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	strb r0, [r4, #0xe]
_08009BF8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009C00: .4byte 0x0202BCEC

