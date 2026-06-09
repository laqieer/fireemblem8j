	.syntax unified
	.set sub_8086AC4, 0x08086AC4 + 1
	.section .text.sub_80A49A4, "ax", %progbits
@ sub_80A49A4 @ JP 0x080A49A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A49A4
	.thumb_func
sub_80A49A4:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8086AC4
	adds r1, r0, #0
	ldrh r0, [r1]
	ldr r2, _080A49C8 @ =0x0000FFFF
	cmp r0, r2
	beq _080A49D4
_080A49B6:
	ldrh r0, [r1]
	cmp r0, r4
	beq _080A49C2
	ldrh r0, [r1, #2]
	cmp r0, r4
	bne _080A49CC
_080A49C2:
	movs r0, #1
	b _080A49D6
	.align 2, 0
_080A49C8: .4byte 0x0000FFFF
_080A49CC:
	adds r1, #0x10
	ldrh r0, [r1]
	cmp r0, r2
	bne _080A49B6
_080A49D4:
	movs r0, #0
_080A49D6:
	pop {r4}
	pop {r1}
	bx r1

