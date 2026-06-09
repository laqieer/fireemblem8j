	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.section .text.sub_80D37E4, "ax", %progbits
@ sub_80D37E4 @ JP 0x080D37E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D37E4
	.thumb_func
sub_80D37E4:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r5, #0
	ldr r3, _080D3858 @ =0x08BB2E60
	movs r1, #0
	ldr r2, _080D385C @ =0x08BABAF4
_080D37F0:
	mov r4, sp
	adds r0, r4, r5
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x54
	adds r0, r0, r5
	strb r1, [r0]
	adds r5, #1
	cmp r5, #0x13
	ble _080D37F0
	ldrb r4, [r3]
	cmp r4, #0xc
	beq _080D3826
	adds r5, r3, #0
_080D380C:
	ldrh r0, [r5, #6]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D381E
	mov r1, sp
	adds r0, r1, r4
	strb r4, [r0]
_080D381E:
	adds r5, #0xc
	ldrb r4, [r5]
	cmp r4, #0xc
	bne _080D380C
_080D3826:
	ldr r0, _080D385C @ =0x08BABAF4
	ldr r1, [r0]
	adds r1, #0x3d
	movs r2, #0
	strb r2, [r1]
	movs r5, #0
	adds r6, r0, #0
	adds r7, r6, #0
_080D3836:
	mov r4, sp
	adds r0, r4, r5
	ldrb r4, [r0]
	cmp r4, #0
	beq _080D3890
	ldr r1, [r6]
	adds r2, r1, #0
	adds r2, #0x3d
	ldrb r0, [r2]
	cmp r0, #0
	bne _080D3860
	adds r0, r1, #0
	adds r0, #0x54
	strb r4, [r0]
	ldr r1, [r7]
	b _080D3888
	.align 2, 0
_080D3858: .4byte 0x08BB2E60
_080D385C: .4byte 0x08BABAF4
_080D3860:
	movs r3, #0
	ldrb r2, [r2]
	cmp r3, r2
	bge _080D3874
	adds r0, r1, #0
	adds r0, #0x54
	ldrb r0, [r0]
	cmp r0, r4
	bne _080D3874
	movs r3, #1
_080D3874:
	cmp r3, #0
	bne _080D3890
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x3d
	adds r0, #0x54
	ldrb r1, [r1]
	adds r0, r0, r1
	strb r4, [r0]
	ldr r1, [r6]
_080D3888:
	adds r1, #0x3d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080D3890:
	adds r5, #1
	cmp r5, #0xb
	ble _080D3836
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

