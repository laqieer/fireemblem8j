	.syntax unified
	.set IsUnitMagicSealed, 0x08018A1C + 1
	.set sub_8086350, 0x08086350 + 1
	.section .text.sub_8023008, "ax", %progbits
@ sub_8023008 @ JP 0x08023008 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023008
	.thumb_func
sub_8023008:
	push {r4, lr}
	ldr r0, _08023048 @ =0x03004DF0
	ldr r2, [r0]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #4]
	adds r4, r0, #0
	cmp r1, #0x51
	beq _08023080
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023080
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0802304C @ =0x0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #5
	beq _08023058
	cmp r0, #5
	bgt _08023050
	cmp r0, #3
	beq _08023058
	b _08023080
	.align 2, 0
_08023048: .4byte 0x03004DF0
_0802304C: .4byte 0x0202E4D8
_08023050:
	cmp r0, #0x38
	bgt _08023080
	cmp r0, #0x37
	blt _08023080
_08023058:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8086350
	cmp r0, #0x10
	bne _08023080
	ldr r0, [r4]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802307C
	movs r0, #2
	b _08023082
_0802307C:
	movs r0, #1
	b _08023082
_08023080:
	movs r0, #3
_08023082:
	pop {r4}
	pop {r1}
	bx r1

