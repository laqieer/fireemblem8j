	.syntax unified
	.set sub_80A9740, 0x080A9740 + 1
	.section .text.sub_80BB7E8, "ax", %progbits
@ sub_80BB7E8 @ JP 0x080BB7E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB7E8
	.thumb_func
sub_80BB7E8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
_080BB7F4:
	mov r0, r8
	lsls r1, r0, #2
	adds r0, r7, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080BB84C
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80A9740
	adds r3, r0, #0
	mov r0, r8
	lsls r4, r0, #1
	adds r0, r7, #0
	adds r0, #0x3c
	adds r1, r0, r4
	ldrh r0, [r3, #0xc]
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x14
	ldr r5, _080BB860 @ =0x000003E7
	cmp r0, r5
	ble _080BB826
	adds r0, r5, #0
_080BB826:
	strh r0, [r1]
	adds r0, r7, #0
	adds r0, #0x40
	adds r6, r0, r4
	ldrb r2, [r3, #0xb]
	ldrb r0, [r3, #0xc]
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #8
	orrs r0, r2
	cmp r0, r5
	ble _080BB840
	adds r0, r5, #0
_080BB840:
	strh r0, [r6]
	adds r0, r7, #0
	adds r0, #0x44
	adds r0, r0, r4
	ldrb r1, [r3]
	strh r1, [r0]
_080BB84C:
	movs r0, #1
	add r8, r0
	mov r0, r8
	cmp r0, #1
	ble _080BB7F4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB860: .4byte 0x000003E7

