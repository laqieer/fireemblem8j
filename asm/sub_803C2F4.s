	.syntax unified
	.set GetCurrentPhase, 0x08024D6C + 1
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_803C2F4, "ax", %progbits
@ sub_803C2F4 @ JP 0x0803C2F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C2F4
	.thumb_func
sub_803C2F4:
	push {r4, r5, r6, lr}
	movs r6, #0
	bl GetCurrentPhase
	adds r5, r0, #0
	adds r4, r5, #1
	b _0803C32E
_0803C302:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0803C32A
	ldr r0, [r2]
	cmp r0, #0
	beq _0803C32A
	ldr r0, [r2, #0xc]
	ldr r1, _0803C33C @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803C32A
	ldrb r1, [r2, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C32A
	adds r6, #1
_0803C32A:
	adds r4, #1
	adds r0, r5, #0
_0803C32E:
	adds r0, #0x80
	cmp r4, r0
	blt _0803C302
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803C33C: .4byte 0x00010005

