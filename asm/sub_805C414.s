	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_805C414, "ax", %progbits
@ sub_805C414 @ JP 0x0805C414 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C414
	.thumb_func
sub_805C414:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _0805C464 @ =0x0201FB2C
	ldr r0, [r0]
	ldr r5, _0805C468 @ =0x0201FB38
	cmp r0, #0
	bne _0805C428
	ldr r5, _0805C46C @ =0x0201FC78
_0805C428:
	ldr r1, [r4, #0x54]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	ldr r1, [r4, #0x58]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r0, _0805C470 @ =0x0000FFFF
	cmp r2, r0
	beq _0805C498
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r2, #0
	ldr r6, [r4, #0x44]
	ldr r7, _0805C474 @ =0x00007FFF
	mov ip, r7
	movs r0, #0
	mov r8, r0
_0805C454:
	ldrh r1, [r3]
	movs r7, #0
	ldrsh r0, [r3, r7]
	cmp r0, ip
	bne _0805C478
	mov r0, r8
	b _0805C48A
	.align 2, 0
_0805C464: .4byte 0x0201FB2C
_0805C468: .4byte 0x0201FB38
_0805C46C: .4byte 0x0201FC78
_0805C470: .4byte 0x0000FFFF
_0805C474: .4byte 0x00007FFF
_0805C478:
	ldrh r0, [r4, #0x32]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldrh r7, [r3, #2]
	adds r0, r0, r7
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #8
	orrs r0, r1
_0805C48A:
	strh r0, [r5]
	adds r3, #4
	adds r5, #2
	adds r2, #1
	cmp r2, #0x77
	bls _0805C454
	b _0805C4A8
_0805C498:
	movs r2, #0
	ldr r6, [r4, #0x44]
	movs r0, #0
_0805C49E:
	strh r0, [r5]
	adds r5, #2
	adds r2, #1
	cmp r2, #0x77
	bls _0805C49E
_0805C4A8:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r6
	bne _0805C4C4
	ldr r1, _0805C4D0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0805C4C4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C4D0: .4byte 0x0201774C

