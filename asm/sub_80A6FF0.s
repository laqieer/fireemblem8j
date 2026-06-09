	.syntax unified
	.section .text.sub_80A6FF0, "ax", %progbits
@ sub_80A6FF0 @ JP 0x080A6FF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6FF0
	.thumb_func
sub_80A6FF0:
	push {lr}
	adds r3, r0, #0
	movs r2, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080A7018
	ldrh r3, [r3]
_080A7000:
	ldrh r0, [r1]
	cmp r0, r3
	bne _080A700C
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _080A701A
_080A700C:
	adds r1, #2
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080A7000
_080A7018:
	ldr r0, _080A7020 @ =0x0000FFFF
_080A701A:
	pop {r1}
	bx r1
	.align 2, 0
_080A7020: .4byte 0x0000FFFF

