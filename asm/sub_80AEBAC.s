	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_80096A4, 0x080096A4 + 1
	.set sub_80A575C, 0x080A575C + 1
	.set sub_80AEB98, 0x080AEB98 + 1
	.set sub_80B4B34, 0x080B4B34 + 1
	.set sub_80B62A8, 0x080B62A8 + 1
	.section .text.sub_80AEBAC, "ax", %progbits
@ sub_80AEBAC @ JP 0x080AEBAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AEBAC
	.thumb_func
sub_80AEBAC:
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #0x20
	strh r0, [r1]
	ldr r0, [r4, #0x58]
	bl Proc_End
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _080AEBCE
	bl sub_80096A4
_080AEBCE:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #8
	beq _080AEC0E
	cmp r0, #8
	bgt _080AEBE6
	cmp r0, #2
	beq _080AEBFE
	cmp r0, #4
	beq _080AEC06
	b _080AEC16
_080AEBE6:
	cmp r0, #0x20
	beq _080AEBF6
	cmp r0, #0x40
	bne _080AEC16
	adds r0, r4, #0
	bl sub_80AEB98
	b _080AEC16
_080AEBF6:
	adds r0, r4, #0
	bl sub_80B62A8
	b _080AEC16
_080AEBFE:
	adds r0, r4, #0
	bl sub_80B4B34
	b _080AEC16
_080AEC06:
	adds r0, r4, #0
	bl sub_80A575C
	b _080AEC16
_080AEC0E:
	ldr r0, _080AEC1C @ =0x08A95548
	adds r1, r4, #0
	bl Proc_StartBlocking
_080AEC16:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEC1C: .4byte 0x08A95548

