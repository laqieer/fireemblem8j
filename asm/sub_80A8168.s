	.syntax unified
	.set sub_8086AC4, 0x08086AC4 + 1
	.set sub_80A776C, 0x080A776C + 1
	.set sub_80A77EC, 0x080A77EC + 1
	.section .text.sub_80A8168, "ax", %progbits
@ sub_80A8168 @ JP 0x080A8168 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A8168
	.thumb_func
sub_80A8168:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r7, r0, #0
	adds r5, r1, #0
	movs r6, #3
	ands r6, r2
	mov r0, sp
	bl sub_80A776C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A81E0
	movs r4, #0
	bl sub_8086AC4
	adds r2, r0, #0
	add r0, sp, #0x20
	mov ip, r0
	b _080A8192
_080A818E:
	adds r4, #1
	adds r2, #0x10
_080A8192:
	ldrh r1, [r2]
	ldr r0, _080A81DC @ =0x0000FFFF
	cmp r1, r0
	beq _080A81AE
	cmp r1, r7
	bne _080A81A4
	ldrh r0, [r2, #2]
	cmp r0, r5
	beq _080A81AE
_080A81A4:
	cmp r1, r5
	bne _080A818E
	ldrh r0, [r2, #2]
	cmp r0, r7
	bne _080A818E
_080A81AE:
	asrs r0, r4, #2
	movs r3, #3
	ands r4, r3
	lsls r1, r4, #1
	mov r2, ip
	adds r4, r2, r0
	ldrb r2, [r4]
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, r6
	bge _080A81E0
	adds r0, r3, #0
	lsls r0, r1
	bics r2, r0
	lsls r6, r1
	adds r0, r2, r6
	strb r0, [r4]
	mov r0, sp
	bl sub_80A77EC
	movs r0, #1
	b _080A81E2
	.align 2, 0
_080A81DC: .4byte 0x0000FFFF
_080A81E0:
	movs r0, #0
_080A81E2:
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

