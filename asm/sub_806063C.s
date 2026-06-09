	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806063C, "ax", %progbits
@ sub_806063C @ JP 0x0806063C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806063C
	.thumb_func
sub_806063C:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _080606AC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080606B0 @ =0x085FFDC0
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _080606B4 @ =0x080E22C6
	str r0, [r5, #0x48]
	ldr r0, _080606B8 @ =0x085FFEA4
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _080606BC @ =0x085FFDD8
	str r0, [r5, #0x54]
	ldr r0, _080606C0 @ =0x08663218
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	ldr r2, _080606C4 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _080606C8 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080606D6
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080606CC
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _080606D6
	.align 2, 0
_080606AC: .4byte 0x0201774C
_080606B0: .4byte 0x085FFDC0
_080606B4: .4byte 0x080E22C6
_080606B8: .4byte 0x085FFEA4
_080606BC: .4byte 0x085FFDD8
_080606C0: .4byte 0x08663218
_080606C4: .4byte 0x03003020
_080606C8: .4byte 0x0203E11C
_080606CC:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_080606D6:
	pop {r4, r5}
	pop {r0}
	bx r0

