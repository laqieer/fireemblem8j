	.syntax unified
	.set Checksum16, 0x080A7740 + 1
	.set IsSramWorking, 0x080A76F4 + 1
	.set StringCompare, 0x08012F50 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A776C, "ax", %progbits
@ sub_80A776C @ JP 0x080A776C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A776C
	.thumb_func
sub_80A776C:
	push {r4, r5, lr}
	sub sp, #0x64
	adds r5, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A77E0
	cmp r5, #0
	bne _080A7782
	mov r5, sp
_080A7782:
	ldr r1, _080A77CC @ =0x03006790
	ldr r0, _080A77D0 @ =0x08A9CA20
	ldr r0, [r0]
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0x64
	bl sub_80D65C8
	ldr r1, _080A77D4 @ =0x081F56A4
	adds r0, r5, #0
	bl StringCompare
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A77E0
	ldr r1, [r5, #8]
	ldr r0, _080A77D8 @ =0x00040624
	cmp r1, r0
	bne _080A77E0
	ldrh r1, [r5, #0xc]
	ldr r0, _080A77DC @ =0x0000200A
	cmp r1, r0
	bne _080A77E0
	adds r4, r5, #0
	adds r4, #0x60
	adds r0, r5, #0
	movs r1, #0x50
	bl Checksum16
	ldrh r1, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _080A77E0
	movs r0, #1
	b _080A77E2
	.align 2, 0
_080A77CC: .4byte 0x03006790
_080A77D0: .4byte 0x08A9CA20
_080A77D4: .4byte 0x081F56A4
_080A77D8: .4byte 0x00040624
_080A77DC: .4byte 0x0000200A
_080A77E0:
	movs r0, #0
_080A77E2:
	add sp, #0x64
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

