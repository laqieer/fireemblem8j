	.syntax unified
	.set MakeCircleWindowBounds, 0x08013330 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_805C934, "ax", %progbits
@ sub_805C934 @ JP 0x0805C934 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C934
	.thumb_func
sub_805C934:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, _0805C9AC @ =0x0201FB2C
	ldr r0, [r0]
	ldr r1, _0805C9B0 @ =0x0201FB38
	mov r8, r1
	cmp r0, #0
	bne _0805C94E
	ldr r2, _0805C9B4 @ =0x0201FC78
	mov r8, r2
_0805C94E:
	ldr r4, [r5, #0x54]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r7, [r0]
	adds r0, r7, #0
	bl MakeCircleWindowBounds
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0, #2]
	ldr r0, _0805C9B8 @ =0x0000FFFF
	cmp r1, r0
	beq _0805C978
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_0805C978:
	ldrh r1, [r5, #0x3a]
	subs r0, r1, r7
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov ip, r0
	cmp r0, #0
	bge _0805C98A
	movs r2, #0
	mov ip, r2
_0805C98A:
	adds r0, r7, r1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0xa0
	ble _0805C996
	movs r4, #0xa0
_0805C996:
	movs r3, #0
	ldr r7, [r5, #0x44]
	mov sb, r7
_0805C99C:
	cmp ip, r3
	bhi _0805C9A4
	cmp r4, r3
	bhs _0805C9BC
_0805C9A4:
	movs r0, #0
	mov r1, r8
	strh r0, [r1]
	b _0805C9E4
	.align 2, 0
_0805C9AC: .4byte 0x0201FB2C
_0805C9B0: .4byte 0x0201FB38
_0805C9B4: .4byte 0x0201FC78
_0805C9B8: .4byte 0x0000FFFF
_0805C9BC:
	ldrh r1, [r5, #0x32]
	ldrh r2, [r6]
	adds r0, r1, r2
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bge _0805C9CC
	movs r2, #0
_0805C9CC:
	ldrh r7, [r6, #2]
	adds r0, r1, r7
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0xf0
	ble _0805C9DA
	movs r1, #0xf0
_0805C9DA:
	lsls r0, r2, #8
	orrs r1, r0
	mov r0, r8
	strh r1, [r0]
	adds r6, #4
_0805C9E4:
	movs r1, #2
	add r8, r1
	adds r3, #1
	cmp r3, #0x9f
	bls _0805C99C
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	cmp r0, sb
	bne _0805CA0E
	ldr r1, _0805CA1C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects
	adds r0, r5, #0
	bl sub_8002DE4
_0805CA0E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805CA1C: .4byte 0x0201774C

