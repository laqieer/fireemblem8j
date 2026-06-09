	.syntax unified
	.set Checksum16, 0x080A7740 + 1
	.set IsSramWorking, 0x080A76F4 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A8890, "ax", %progbits
@ sub_80A8890 @ JP 0x080A8890 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A8890
	.thumb_func
sub_80A8890:
	push {r4, lr}
	sub sp, #0x24
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A88DC
	cmp r4, #0
	bne _080A88A6
	mov r4, sp
_080A88A6:
	ldr r1, _080A88D0 @ =0x03006790
	ldr r0, _080A88D4 @ =0x08A9CA20
	ldr r0, [r0]
	ldr r2, _080A88D8 @ =0x00007224
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x24
	bl sub_80D65C8
	adds r0, r4, #0
	movs r1, #0x20
	bl Checksum16
	ldrh r1, [r4, #0x20]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _080A88DC
	movs r0, #1
	b _080A88DE
	.align 2, 0
_080A88D0: .4byte 0x03006790
_080A88D4: .4byte 0x08A9CA20
_080A88D8: .4byte 0x00007224
_080A88DC:
	movs r0, #0
_080A88DE:
	add sp, #0x24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

