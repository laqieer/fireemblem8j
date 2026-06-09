	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80D12D0, "ax", %progbits
@ sub_80D12D0 @ JP 0x080D12D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D12D0
	.thumb_func
sub_80D12D0:
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x14]
	adds r0, r1, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #1
	beq _080D12FA
	cmp r0, #1
	bgt _080D12EA
	cmp r0, #0
	beq _080D12F0
	b _080D133E
_080D12EA:
	cmp r0, #2
	beq _080D1312
	b _080D133E
_080D12F0:
	adds r0, r2, #0
	movs r1, #2
	bl Proc_Goto
	b _080D133E
_080D12FA:
	adds r0, r1, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D131C
	cmp r0, #1
	bne _080D133E
	adds r0, r2, #0
	movs r1, #4
	bl Proc_Goto
	b _080D133E
_080D1312:
	adds r0, r1, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	bne _080D1332
_080D131C:
	adds r0, r1, #0
	adds r0, #0x35
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x3b
	strb r0, [r1]
	adds r0, r2, #0
	movs r1, #5
	bl Proc_Goto
	b _080D133E
_080D1332:
	cmp r0, #1
	bne _080D133E
	adds r0, r2, #0
	movs r1, #4
	bl Proc_Goto
_080D133E:
	pop {r0}
	bx r0
	.align 2, 0

