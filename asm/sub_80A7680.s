	.syntax unified
	.set SetSramFastFunc, 0x080D64AC + 1
	.set sub_80D6420, 0x080D6420 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A7680, "ax", %progbits
@ sub_80A7680 @ JP 0x080A7680 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7680
	.thumb_func
sub_80A7680:
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _080A76D8 @ =0x12345678
	str r0, [sp]
	ldr r0, _080A76DC @ =0x87654321
	str r0, [sp, #4]
	bl SetSramFastFunc
	ldr r2, _080A76E0 @ =0x04000200
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r5, _080A76E4 @ =0x08A9CA20
	ldr r1, [r5]
	ldr r4, _080A76E8 @ =0x000073A0
	adds r1, r1, r4
	mov r0, sp
	movs r2, #4
	bl sub_80D6420
	ldr r2, _080A76EC @ =0x03006790
	ldr r0, [r5]
	adds r0, r0, r4
	add r1, sp, #4
	ldr r3, [r2]
	movs r2, #4
	bl sub_80D65C8
	ldr r3, _080A76F0 @ =0x0203E88A
	movs r2, #0
	ldr r1, [sp, #4]
	ldr r0, [sp]
	cmp r1, r0
	bne _080A76CC
	movs r2, #1
_080A76CC:
	strb r2, [r3]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A76D8: .4byte 0x12345678
_080A76DC: .4byte 0x87654321
_080A76E0: .4byte 0x04000200
_080A76E4: .4byte 0x08A9CA20
_080A76E8: .4byte 0x000073A0
_080A76EC: .4byte 0x03006790
_080A76F0: .4byte 0x0203E88A

