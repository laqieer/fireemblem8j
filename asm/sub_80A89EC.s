	.syntax unified
	.set Checksum16, 0x080A7740 + 1
	.set IsSramWorking, 0x080A76F4 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A89EC, "ax", %progbits
@ sub_80A89EC @ JP 0x080A89EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A89EC
	.thumb_func
sub_80A89EC:
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A8A38
	cmp r4, #0
	bne _080A8A02
	mov r4, sp
_080A8A02:
	ldr r1, _080A8A2C @ =0x03006790
	ldr r0, _080A8A30 @ =0x08A9CA20
	ldr r0, [r0]
	ldr r2, _080A8A34 @ =0x00007248
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x14
	bl sub_80D65C8
	adds r0, r4, #0
	movs r1, #0x10
	bl Checksum16
	ldrh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _080A8A38
	movs r0, #1
	b _080A8A3A
	.align 2, 0
_080A8A2C: .4byte 0x03006790
_080A8A30: .4byte 0x08A9CA20
_080A8A34: .4byte 0x00007248
_080A8A38:
	movs r0, #0
_080A8A3A:
	add sp, #0x14
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

