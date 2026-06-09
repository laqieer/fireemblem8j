	.syntax unified
	.section .text.FixROMUnitStructPtr, "ax", %progbits
@ FixROMUnitStructPtr @ JP 0x08017BDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global FixROMUnitStructPtr
	.thumb_func
FixROMUnitStructPtr:
	push {lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r3, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08017C0A
	ldrb r0, [r3, #4]
	subs r1, r0, #1
	cmp r1, #0
	bgt _08017C00
	movs r0, #0
	b _08017C08
_08017C00:
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, _08017C10 @ =0x08858288
	adds r0, r1, r0
_08017C08:
	str r0, [r2]
_08017C0A:
	pop {r0}
	bx r0
	.align 2, 0
_08017C10: .4byte 0x08858288

