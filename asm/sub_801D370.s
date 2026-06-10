	.syntax unified
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807AB0C, 0x0807AB0C + 1
	.set sub_807AB44, 0x0807AB44 + 1
	.section .text.sub_801D370, "ax", %progbits
@ sub_801D370 @ JP 0x0801D370 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D370
	.thumb_func
sub_801D370:
	push {r4, lr}
	bl sub_807AB44
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D3AE
	ldr r4, _0801D3B8 @ =0x03004DF0
	ldr r2, [r4]
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	ldr r1, _0801D3BC @ =0x0202BCEC
	ldrb r1, [r1, #0xf]
	cmp r0, r1
	bne _0801D3AE
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	beq _0801D3AE
	cmp r1, #4
	beq _0801D3AE
	adds r0, r2, #0
	bl sub_807A888
	ldr r0, [r4]
	bl sub_80280A0
_0801D3AE:
	bl sub_807AB0C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D3B8: .4byte 0x03004DF0
_0801D3BC: .4byte 0x0202BCEC

