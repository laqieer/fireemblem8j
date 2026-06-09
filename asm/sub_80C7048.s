	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80C2B14, 0x080C2B14 + 1
	.set sub_80C2C24, 0x080C2C24 + 1
	.section .text.sub_80C7048, "ax", %progbits
@ sub_80C7048 @ JP 0x080C7048 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7048
	.thumb_func
sub_80C7048:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #2
	ldr r7, _080C708C @ =0x03005270
	adds r4, r7, #0
	adds r4, #8
_080C7054:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080C706C
	ldrb r0, [r7, #0x11]
	ldrb r1, [r4, #0x11]
	cmp r0, r1
	bne _080C706C
	ldr r0, [r6, #0x54]
	adds r1, r5, #0
	bl sub_80C2B14
_080C706C:
	adds r4, #4
	adds r5, #1
	cmp r5, #6
	ble _080C7054
	ldr r0, _080C708C @ =0x03005270
	ldrb r1, [r0, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C7090
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	b _080C709A
	.align 2, 0
_080C708C: .4byte 0x03005270
_080C7090:
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #0xf7
	ands r0, r1
_080C709A:
	strb r0, [r2]
	ldr r0, _080C70B0 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	movs r1, #0
	bl sub_80C2C24
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C70B0: .4byte 0x08AC1108

